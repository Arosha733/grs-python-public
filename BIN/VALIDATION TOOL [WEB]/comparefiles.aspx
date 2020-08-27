<%@ Page Language="VB" AutoEventWireup="false" CodeFile="comparefiles.aspx.vb" Inherits="comparefiles" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
  <meta charset="utf-8"/>
  <meta http-equiv="X-UA-Compatible" content="IE=Edge,chrome=1"/>
  <link rel="stylesheet" type="text/css" href="diffview.css"/>
  <script type="text/javascript" src="diffview.js"></script>
  <script type="text/javascript" src="difflib.js"></script>
<style type="text/css">
body {
  font-size: 12px;
  font-family: Sans-Serif;
}
h2 {
  margin: 0.5em 0 0.1em;
  text-align: center;
}
.top {
  text-align: center;
}
.textInput {
  display: block;
  width: 49%;
  float: left;
}
textarea {
  width:100%;
  height:300px;
}
label:hover {
  text-decoration: underline;
  cursor: pointer;
}
.spacer {
  margin-left: 10px;
}
.viewType {
  font-size: 16px;
  clear: both;
  text-align: center;
  padding: 1em;
}
#diffoutput {
  width: 100%;
}
</style>

<script type="text/javascript">

function diffUsingJS(viewType) {
  "use strict";
  var byId = function (id) { return document.getElementById(id); },
    base = difflib.stringAsLines(byId("baseText").value),
    newtxt = difflib.stringAsLines(byId("newText").value),
    sm = new difflib.SequenceMatcher(base, newtxt),
    opcodes = sm.get_opcodes(),
    diffoutputdiv = byId("diffoutput"),
    contextSize = byId("contextSize").value;

  diffoutputdiv.innerHTML = "";
  contextSize = contextSize || null;

  diffoutputdiv.appendChild(diffview.buildView({
    baseTextLines: base,
    newTextLines: newtxt,
    opcodes: opcodes,
    baseTextName: "Base Text",
    newTextName: "New Text",
    contextSize: contextSize,
    viewType: viewType
  }));
}

</script>
</head>
<body>
  <div class="top">
    <strong>Context size (optional):</strong> <input type="text" id="contextSize" value="" />
  </div>
  <div class="textInput">
    <h2>Pre check</h2>
    <textarea id="baseText" runat="server" readonly></textarea>
  </div>
  <div class="textInput spacer">
    <h2>Post check</h2>
    <textarea id="newText" runat="server" readonly></textarea>
  </div>
    <% Response.Write(xmystring.ToString()) %>
  <div class="viewType">
    <input type="radio" name="_viewtype" id="sidebyside" onclick="diffUsingJS(0);" /> <label for="sidebyside">Side by Side Diff</label>
    &nbsp; &amp;amp;amp;nbsp;
    <input type="radio" name="_viewtype" id="inline" onclick="diffUsingJS(1);" /> <label for="inline">Inline Diff</label>
  </div>
  <div id="diffoutput"> </div>

</body>
</html>