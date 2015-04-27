# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

 
EditorSetup =  {
  
    init: () -> 
      editor = ace.edit("editor");
      editor.setTheme("ace/theme/monokai");
      editor.getSession().setMode("ace/mode/java");
      editor.setShowPrintMargin(false);
      document.getElementById('editor').style.fontSize='14px';
      jQuery("#submit_button").click ->
        jQuery("#realacesubmit").val(editor.getValue());
        jQuery("#form_tag_id").submit();
    }

jQuery(EditorSetup.init);