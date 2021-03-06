<html>
  <head>
    <title>Create ToDo</title>
    <meta name="layout" content="main"></meta>
  </head>
  <body>
    <h1>toDoを作成します</h1>${parent?.title}
      <g:form action="crud">
        <table border=1 cellspacing=0 cellpadding=3 bordercolor="#ff0000">
          <thead  style="background:#f0ffff">
            <tr>
              <td width="10%">-</td>
              <td width="90%">内容</td>
            </tr>
          </thead>
          <tbody>
            <tr>
              <td bgcolor="#f0ffff">タイトル</td>
              <td><g:textField name="title" size="60" maxlength="60" value="${issue?.title}" /></td>
            </tr>
            <tr>
              <td bgcolor="#f0ffff">詳細</td>
              <td><g:textArea name="description" value="" rows="5" cols="60"/></td>
            </tr>
            <tr>
              <td bgcolor="#f0ffff">開始日</td>
              <td><g:datePicker name="opened" value="${issue?.opened}" precision="day" ></g:datePicker></td>
            </tr>
            <tr>
              <td bgcolor="#f0ffff">終了日</td>
              <td><g:datePicker name="closed" value="${issue?.closed}" precision="day" ></g:datePicker></td>
            </tr>
            <tr>
              <td bgcolor="#f0ffff">状態</td>
              <td><g:select optionKey="id" name="state" from="${State.list()}" name="state.id" /></td>
            </tr>
          </tbody>
        </table>

        <g:submitButton name="entry" value="登録" />
        <g:submitButton name="cancel" value="cancel" />

        <g:hiddenField name="id" size="6" maxlength="4" value="${id}" /><br/>
        <g:hiddenField name="referenceId" size="6" maxlength="4" value="${issue.referenceId}" /><br/>
        <g:hiddenField name="deeps" size="6" maxlength="4" value="${issue.deeps}" /><br/>

      </g:form>

      <g:hasErrors bean="${issue}">
        <g:eachError><p>${it.defaultMessage}</p></g:eachError>
      </g:hasErrors>
  </body>
</html>
