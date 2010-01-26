class TodoController {

    // listing するサービス
    def todoService

    def index = {
        redirect(action:"crud")
    }

    def crudFlow = {
      // startをaction stateにして read stateに遷移
        start {
            action {
                [issues:todoService.list()]
            }
            on("success").to "read"
        }

        read {
            on("read").to "start"

            on("create") {
                def issue = new Issue([title:params.title])
                ["issue":issue, "parent":null]
            }.to "create"

            on("update") {
                def issue = Issue.get(params.id)
                ["issue":issue]
            }.to "update"

            on("delete").to "delete"
            on("subtask") {
                def parent = Issue.get(params.id)
                def issue = new Issue([title:'', referenceId:params.id, deeps:parent.deeps+1])
                ["issue":issue, "parent":parent]
            }.to "create"
        }

        delete {
            action {
                Issue.executeUpdate("delete Issue where id = ${params.id}")
            }
            on("success").to "start"
        }

        create {
            on("cancel").to "start"
            on("entry") {
                def issue = new Issue(params)
                if(!issue.save()) {
                    // エラー処理
                    return error([issue:issue])
                }
            }.to "start"
        }

        update {
            on("cancel").to "start"
            on("update") {
                def issue = Issue.get(params.id)
                issue.properties = params
                if(!issue.save(flush:true)) {
                    // エラー処理
                    return error([issue:issue])
                }
            }.to "start"
        }
    }

}
