//= require jquery
//= require rails-ujs
//= require dropzone
//= require turbolinks
//= require activestorage
//= require bootstrap-sprockets
// direct_uploads.js
//= require moment
//= require fullcalendar
//= require daterangepicker
 //= require_tree .

addEventListener("direct-upload:initialize", event => {
    const { target, detail } = event
    const { id, file } = detail
    target.insertAdjacentHTML("beforebegin", `
      <div id="direct-upload-${id}" class="direct-upload direct-upload--pending">
        <div id="direct-upload-progress-${id}" class="direct-upload__progress" style="width: 0%"></div>
        <span class="direct-upload__filename">${file.name}</span>
      </div>
    `)
  })
   
  addEventListener("direct-upload:start", event => {
    const { id } = event.detail
    const element = document.getElementById(`direct-upload-${id}`)
    element.classList.remove("direct-upload--pending")
  })
   
  addEventListener("direct-upload:progress", event => {
    const { id, progress } = event.detail
    const progressElement = document.getElementById(`direct-upload-progress-${id}`)
    progressElement.style.width = `${progress}%`
  })
   
  addEventListener("direct-upload:error", event => {
    event.preventDefault()
    const { id, error } = event.detail
    const element = document.getElementById(`direct-upload-${id}`)
    element.classList.add("direct-upload--error")
    element.setAttribute("title", error)
  })
   
  addEventListener("direct-upload:end", event => {
    const { id } = event.detail
    const element = document.getElementById(`direct-upload-${id}`)
    element.classList.add("direct-upload--complete")
  })

  function toggleWorkOrder() {
    var element = document.querySelector(".work-order-toggle");
    var hidePunchlist = document.querySelector(".punchlist-active");
    var hideContractor = document.querySelector(".contractor-active");
    if (hidePunchlist) { hidePunchlist.classList.toggle("punchlist-active") }
    if (hideContractor) { hideContractor.classList.toggle("contractor-active") }
    element.classList.toggle("work-order-active");
  }
  function togglePunchList() {
    var element = document.querySelector(".punchlist-toggle");
    var hideWorkOrder = document.querySelector(".work-order-active");
    var hideContractor = document.querySelector(".contractor-active");
    if (hideWorkOrder) { hideWorkOrder.classList.toggle("work-order-active") }
    if (hideContractor) { hideContractor.classList.toggle("contractor-active") }
    element.classList.toggle("punchlist-active");
  }
  function toggleContractor() {
    var element = document.querySelector(".contractor-toggle");
    var hidePunchlist = document.querySelector(".punchlist-active");
    var hideWorkOrder = document.querySelector(".work-order-active");
    if (hidePunchlist) { hidePunchlist.classList.toggle("punchlist-active") }
    if (hideWorkOrder) { hideWorkOrder.classList.toggle("work-order-active") }
    element.classList.toggle("contractor-active");
  }
  