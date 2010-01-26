<html>
  <head>
    <title>Read ToDo</title>
    <meta name="layout" content="main"></meta>
  </head>
  <body>
    <h1>ToDo</h1>
    <g:form action="crud">
      <g:textField name="id" size="6" maxlength="4" value="${id}" />
      <g:textField name="title" size="60" maxlength="60" value="${title}" />
      <g:submitButton name="create" value="登録" />
    </g:form>
    <table>
      <thead  style="background:#f0ffff">
        <tr>
          <td width="91%">issue</td>
          <td width="3%">x</td>
          <td width="3%">y</td>
          <td width="3%">z</td>
        </tr>
      </thead>
      <tbody>
        <ul>
        <g:each in="${issues}" var="issue">
          <tr>
            <td>
              <li>${"　"*issue.deeps}${String.format("%04d", issue.id)}:
                <g:if test="${issue.state.name == 'close'}">
                  <strike>
                </g:if>
                <g:link action="crud" event="update" id="${issue.id}">${issue.title}</g:link>
                <g:if test="${issue.state.name == 'close'}">
                  </strike>
                </g:if>
            </td>
            <td align="center">
              <g:link action="crud" event="update" id="${issue.id}">
                <img src="${resource(dir:'images',file:'edit.png')}" alt="update" />
              </g:link>
            </td>
            <td align="center">
              <g:link action="crud" event="subtask" id="${issue.id}">
                <img src="${resource(dir:'images',file:'share.png')}" alt="subtask" />
              </g:link>
            </td>
            <td align="center">
              <g:link action="crud" event="delete" id="${issue.id}">
                <img src="${resource(dir:'images',file:'cancel.png')}" alt="delete" />
              </g:link>
            </td>
          </tr>
        </g:each>
        </ul>
      </tbody>
    </table>
    <hr>
    <g:link action="crud" event="create">create</g:link>|
    <g:link action="crud" event="read">read</g:link>|
  </body>
</html>
