<html>
  <head>
    <title>Subtask ToDo</title>
    <meta name="layout" content="main"></meta>
  </head>
  <body>
    <h1>toDoを作成します</h1>
    <g:form action="crud">
      <g:textField name="id" size="6" maxlength="4" value="${id}" /><br/>
      <g:textField name="title" size="60" maxlength="60" value="${title}" /><br/>
      <g:textArea name="description" value="" rows="5" cols="50"/><br/>
      <g:datePicker name="opened" value="${issue?.opened}" precision="day" ></g:datePicker><br/>
      <g:datePicker name="closed" value="${issue?.closed}" precision="day" ></g:datePicker><br/>

      <g:select optionKey="id" name="state" from="${State.list()}" name="state.id" /><br />

      <g:submitButton name="cancel" value="cancel" />
      <g:submitButton name="entry" value="登録" />
    </g:form>

    <g:hasErrors bean="${issue}">
      <g:eachError><p>${it.defaultMessage}</p></g:eachError>
    </g:hasErrors>
  </body>
</html>