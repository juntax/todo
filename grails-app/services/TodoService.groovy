class TodoService {

    boolean transactional = true

    def list() {
        return orderIssue(Issue.findAll())
    }


    /**
     * Issueリストを親,子順に並べる.
     *
     */
    def orderIssue(list, result=[]) {

        if(list.size() == 0) {
            return result
        }

        def first = list[0]
        if(list.size() == 1) {
            return result << first
        }

        def rest = list[1..-1]
        def child = rest.findAll { n -> n.referenceId == first.id }

        if(child.size() == 0) {
            result << first
            return list.size() > 1 ? orderIssue(rest, result) : result
        } else {
            child += rest.findAll { n -> n.referenceId != first.id }
            result += first
            return result += orderIssue(child)
        }
    }

}

