/*
 * jQuery UI Checkbox & Radiobutton
 *
 * Copyright (c) 2009 sompylasar (maninblack.msk@hotmail.com ; http://maninblack.info/)
 * Licensed under the MIT (MIT-LICENSE.txt)
 *
 * Permission is hereby granted, free of charge, to any person obtaining
 * a copy of this software and associated documentation files (the
 * "Software"), to deal in the Software without restriction, including
 * without limitation the rights to use, copy, modify, merge, publish,
 * distribute, sublicense, and/or sell copies of the Software, and to
 * permit persons to whom the Software is furnished to do so, subject to
 * the following conditions:
 * 
 * The above copyright notice and this permission notice shall be
 * included in all copies or substantial portions of the Software.
 * 
 * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
 * EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
 * MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
 * NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE
 * LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION
 * OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION
 * WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
 */
/**
 * jQuery UI Checkbox & Radiobutton
 *
 * Depends on:
 * jQuery v1.3.2:
 *   jquery-1.3.2.js
 * jQuery UI v1.7.2:
 *   ui.core.js
 *   ui.core.css
 *   ui.theme.css
 *   ui.checkbox-ui.radiobutton.css
 */

(function ($) {
    var _updateState, _updateRadioGroup;
  var _checked = function (widget, value) {
    if (typeof value != 'undefined') { 
      widget.input.attr('checked', !!value); 
      _updateState(widget);
      _updateRadioGroup(widget);
      return widget.element;
    }
    else {
      return widget.input.attr('checked');
    }
  };
  var _toggleChecked = function (widget, value) {
      return _checked(widget, !_checked(widget));
  };
  var _disabled = function (widget, value) {
      if (typeof value != 'undefined') {
          widget.input.attr('disabled', !!value); 
          _updateState(widget);
          return widget.element;
    }
    else {
      return widget.input.attr('disabled');
    }
  };
  var _toggleDisabled = function (widget, value) {
      return _disabled(widget, !_disabled(widget));
  };
  _updateRadioGroup = function (widget) {
      if (!widget.is_radio) return;
      
      var radiosFromGroup = $('input[name='+widget.input.attr('name')+'][type=radio]');
      radiosFromGroup.each(function () { if (this != widget.input) $(this).radiobutton('repaint'); });
  };
    _updateState = function (widget) {
      var is_radio = widget.is_radio;
        
      widget.options.checked = _checked(widget);
      widget.options.disabled = _disabled(widget);
    
    var changed = (widget.div.hasClass('ui-state-checked') != widget.options.checked);
    var disabled_change = (widget.div.hasClass('ui-state-disabled') != widget.options.disabled),
      disabled = (disabled_change && widget.options.disabled), enabled = (disabled_change && !widget.options.disabled);
      
    if (widget.options.checked) {
      if (is_radio) widget.icon.removeClass('ui-icon-radio-off').addClass('ui-icon-radio-on');
      else widget.icon.removeClass('ui-icon-none').addClass('ui-icon-check');
      
      widget.div.addClass('ui-state-checked');
    }
    else {
      if (is_radio) widget.icon.removeClass('ui-icon-radio-on').addClass('ui-icon-radio-off');
      else widget.icon.removeClass('ui-icon-check').addClass('ui-icon-none');
      
      widget.div.removeClass('ui-state-checked');
    }
    
    if (widget.options.disabled) {
        widget.div.addClass('ui-state-disabled');
    }
    else {
        widget.div.removeClass('ui-state-disabled');
    }
    
    if (changed) try { widget._trigger('changed', {}); } catch (e) {}
    if (disabled) try { widget._trigger('disabled', {}); } catch (e) {}
    if (enabled) try { widget._trigger('enabled', {}); } catch (e) {}
  };
  
  var _extendInput = function (widget) {
    var input = widget.input = widget.element;
    var is_radio = widget.is_radio = input.is('input[type=radio]');
        
    var widgetClassName = widget.widgetBaseClass;
    
    // get the associated label using the input's id
    var id = input.attr('id');
    var label = widget.label = (id ? $('label[for='+id+']') : $([]));
    var label_occupied = label.hasClass(''+widgetClassName+'-label'); // the same label for more than one control (e.g. radio group)
    if (!label_occupied) label.addClass('ui-input-label '+widgetClassName+'-label');
    
    // wrap the input + label in a div 
    var div = widget.div = $('<div class="ui-widget ui-corner-all ui-input '+widgetClassName+' ui-state-default"/>');
    var icon = widget.icon = $('<span class="ui-icon"/>');
    div.insertBefore(input).append(icon).append(input);
    input.addClass('ui-helper-hidden-accessible');
    
    $.data(div[0], widget.widgetName, widget);
    label.each(function () { $.data(this, widget.widgetName, widget); });
    
    var group_labels = $([]).add(label); // every label of grouped radiobuttons
    var group_divs = $([]).add(div); // every radiobutton wrapper in the group
    var radiosFromGroup = $('input[name='+input.attr('name')+'][type=radio]');
    radiosFromGroup.each(function () {
        var input = $(this);
        var div = input.parents('.'+widgetClassName);
        var id = input.attr('id');
        var label = (id ? $('label[for='+id+']') : $([]));
        group_divs = group_divs.add(div);
        group_labels = group_labels.add(label);
    });
    
    var div_and_label_optional = $([]).add(div); // current radiobutton and label (if not captured by other input)
    if (!label_occupied) div_and_label_optional = div_and_label_optional.add(label);
    
      div_and_label_optional
          .bind('click.'+widgetClassName+'', function (event) { 
              var ret;
          var disabled = _disabled(widget);
          if (!disabled && event.target != input[0]) {
              if (is_radio) {
                  var t = $(event.target);
                  if (t.is('label') && group_labels.length == 1) { // cycle through radiobuttons
                        var radiosFromGroup = $('input[name='+input.attr('name')+'][type=radio]');
                        var current_checked = radiosFromGroup.filter(function () { return $(this).attr('checked'); });
                        var index = radiosFromGroup.index(current_checked);
                        var next_input = radiosFromGroup.eq((index+1) >= radiosFromGroup.length ? 0 : index+1);
                        var next_div = next_input.parents('.'+widgetClassName);
                        next_input.radiobutton('option', 'checked', true);
                        if (!next_div.hasClass('ui-state-focus')) next_input.focus();
                        ret = false;
                  }
                  else {
              if (!div.hasClass('ui-state-focus')) input.focus();
                      _checked(widget, true);
                      _updateState(widget);
                      _updateRadioGroup(widget);
                  }
              }
              else {
                  if (!div.hasClass('ui-state-focus')) input.focus();
                  _toggleChecked(widget);
                  ret = false;
              }
          }
          if (disabled) ret = false;
          return ret;
      });

      group_divs.add(group_labels)
          .bind('mouseover.'+widgetClassName+' mouseenter.'+widgetClassName+'', function(){ 
        if (_disabled(widget)) return;
        
        if (!widget.options.highlightGroup) {
          var obj = $(this);
          if (obj.is('label')) {
            obj = $('#'+obj.attr('for'));
            var w = (obj.length ? $.data(obj[0], widget.widgetName) : null);
            if (w && w.div && !_disabled(w)) {
              w.div.addClass('ui-state-hover');
            }
          }
          else {
            obj.addClass('ui-state-hover');
          }
          }
        else {
          group_divs.addClass('ui-state-hover'); 
        }
      })
      .bind('mouseout.'+widgetClassName+' mouseleave.'+widgetClassName+'', function(){ 
          group_divs.removeClass('ui-state-hover ui-state-active'); 
      });
      group_divs
      .bind('mousedown.'+widgetClassName+'', function () { 
          if (_disabled(widget)) return;
          (widget.options.highlightGroup ? group_divs : $(this)).addClass('ui-state-active ui-state-down'); 
      })
      .bind('mouseup.'+widgetClassName+'', function () { 
          group_divs.removeClass('ui-state-active ui-state-down'); 
      });
    
    input
        .bind('click.'+widgetClassName+' change.'+widgetClassName+'', function () { 
            _updateState(widget); 
            _updateRadioGroup(widget); 
        })
      .bind('focus.'+widgetClassName+'', function(){
        div.addClass('ui-state-focus');
        
        try { 
        widget._trigger('focus', {});
        } catch (e) {}
      })
      .bind('blur.'+widgetClassName+'', function(){ 
        div.removeClass('ui-state-focus');
        
        try { 
        widget._trigger('blur', {}); 
        } catch (e) {}
      });
    
    _updateState(widget);
    _updateRadioGroup(widget);
  };
  var _destroyInput = function (widget) {
    var input = widget.element;
    var div = input.parents('div.ui-input');
    if (!div.length) return;
    
    var label = widget.label;
    var widgetClassName = 'ui-' + (input.is(':checkbox') ? 'checkbox' : 'radiobutton');
    
    $([]).add(div).add(input).add(label).unbind('.'+widgetClassName)
        .removeClass('ui-widget ui-corner-all ui-input '+widgetClassName+' '+widgetClassName+'-label'
            +'ui-state-default ui-state-hover ui-state-active ui-state-down ui-state-highlight ui-state-checked');
        
    $.data(div[0], widget.widgetName, null);
    $.data(label[0], widget.widgetName, null);
    
    div.after(input).remove();
    input.removeClass('ui-helper-hidden-accessible');
  };
  
  var _methods = {
    _setData: function (key, value) {
      this.options[key] = value;
      if (key == 'checked') _checked(this, value);
      else if (key == 'disabled') _disabled(this, value);
    },
    toggle: function () {
      _toggleChecked(this);
    },
    enable: function () {
        _disabled(this, false);
    },
    disable: function () {
        _disabled(this, true);
    },
    repaint: function () {
        _updateState(this);
    },
    originalElement: function () {
      return this.element;
    },
    destroy: function () {
      _destroyInput(this);
    }
  };
  
  $.widget('ui.checkbox', $.extend({}, _methods, {
      _init: function () { 
          if (!this.element.is('input[type=checkbox]')) throw 'Elements other than input[type=checkbox] are not supported.';
      
      this.widgetEventPrefix = 'ui-checkbox-';
          
          _extendInput(this);
      }
  }));
  $.extend($.ui.checkbox, {
    version: '1.7.2',
    eventPrefix: 'ui-radiobutton-',
    defaults: {
        checked: false,
        disabled: false
    },
    getter: 'originalElement'
  });
  
  $.widget('ui.radiobutton', $.extend({}, _methods, {
      _init: function () { 
          if (!this.element.is('input[type=radio]')) throw 'Elements other than input[type=radio] are not supported.';
      
          _extendInput(this);
      }
  }));
  $.extend($.ui.radiobutton, {
    version: '1.7.2',
    eventPrefix: 'ui-radiobutton-',
    defaults: {
        checked: false,
        disabled: false,
      highlightGroup: false
    },
    getter: 'originalElement'
  });
})(jQuery);