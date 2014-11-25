$ ->
  $("a[data-dropbox-user-id]").click (e) ->
    e.preventDefault()
    userId = $(this).data("dropbox-user-id")
    Dropbox.choose(
      success: (files) ->
        
        console.log("filename = " + files[0].name)

        $.ajax
          dataType: "js"
          type: 'post'
          url: "/file_messages"
          data:
            recipient_id: userId
            file_message: files[0]

          success: (data)->
#            console.log("success() = ")
#            console.log("data.notice = " + data.notice)
#            alert data.notice
#            msg = request.getResponseHeader("X-Message")
#            alert msg  if msg
#            $("#notice").update data.responseText
            return

          error: ->

        return

      linkType: "direct"
    )


    console.log("userId = " + userId)