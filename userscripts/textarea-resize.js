// ==UserScript==
// @name            Textarea Resize
// @description        Provides keyboard shortcuts for resizing textareas
// @include            *
// ==/UserScript==

// Based on code from Greasemonkey Hacks: Tips & Tools for Remixing the Web with Firefox
// I got it from https://www.safaribooksonline.com/library/view/greasemonkey-hacks/0596101651/ch04s07.html



function addGlobalStyle(css) {
    var head, style;
    head = document.getElementsByTagName('head')[0];
    if (!head) { return; }
    style = document.createElement('style');
    style.type = 'text/css';
    style.innerHTML = css;
    head.appendChild(style);
}


addGlobalStyle (
    // For JIRA Comment fields, ignore the element style's height
    'textarea.wiki-textfield {height: auto !important; overflow: scroll !important;} ' +
    // For Jenkins pipeline editor
    'div.workflow-editor-wrapper div.editor {height: 750px !important;}'
);


var instrumentTextarea = function(textarea) {
    var centerTextarea = function() {
        if (textarea.scrollIntoView) {
            textarea.scrollIntoView(false);
        } else {
            textarea.wrappedJSObject.scrollIntoView(false);
        }
    };

    var textareaKeydown = function(e) {
        if (e.shiftKey && e.ctrlKey && e.keyCode == 69) {
            // shift-ctrl-e
            textarea.rows /= 2;
            centerTextarea();
        }
        else if (e.ctrlKey && e.keyCode == 69) {
            // ctrl-e
            if (textarea.offsetHeight < window.innerHeight - 40) {
                textarea.rows *= 2;
            }
            centerTextarea();
        }
    };

    textarea.addEventListener("keydown", textareaKeydown, 0);
};

var textareas = document.getElementsByTagName("textarea");
for (var i = 0; i < textareas.length; i++) {
    instrumentTextarea(textareas[i]);
}
