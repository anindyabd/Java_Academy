# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$(document).ready -> 
    editor = ace.edit("editor");
    editor.setTheme("ace/theme/monokai");
    editor.getSession().setMode("ace/mode/java");
    document.getElementById("submit_button").addEventListener "click", () ->
        document.getElementById("realacesubmit").value = editor.getValue();
        document.getElementById("form_tag_id").submit();
