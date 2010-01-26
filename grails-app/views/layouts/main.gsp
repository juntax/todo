<html>
    <head>
        <title><g:layoutTitle default="Todo" /></title>
        <link rel="stylesheet" href="${resource(dir:'css',file:'main.css')}" />
        <link rel="shortcut icon" href="${resource(dir:'images',file:'favicon.ico')}" type="image/x-icon" />
        <g:layoutHead />
        <g:javascript library="application" />
    </head>
    <body onload="${pageProperty(name:'body.onload')}">
      <div class="header">
      </div>
      <div class="body">
        <g:layoutBody />
      </div>
      <div class="footer">
      </div>
    </body>
</html>
