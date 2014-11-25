# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
# FLASH NOTICE ANIMATION
###
fade_flash = ->
  $("#flash_notice").delay(5000).fadeOut "slow"
  $("#flash_alert").delay(5000).fadeOut "slow"
  $("#flash_error").delay(5000).fadeOut "slow"
  return

fade_flash()
show_ajax_message = (msg, type) ->
  $("#flash-message").html "<div id=\"flash_" + type + "\">" + msg + "</div>"
  fade_flash()
  return

$("#flash-message").ajaxComplete (event, request) ->
  msg = request.getResponseHeader("X-Message")
  type = request.getResponseHeader("X-Message-Type")
  show_ajax_message msg, type #use whatever popup, notification or whatever plugin you want
  return
###
