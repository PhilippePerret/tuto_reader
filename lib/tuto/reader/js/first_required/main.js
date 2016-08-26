
const SCRIPT_FILE_PATH  = "<%= tuto.script.path %>";
const DUREE_LECTURE_MOT = <%= tuto.reader.options[:duree_lecture_mot] %>;
const PHRASES           = <%= tuto.script.javascript_phrases %>;

/**
  * Classe d'un élément du DOM
  */
function DOMElement(id){
  this.id = id;
  this.element = document.getElementById(id);
  if (this.element){
    // console.log("L'élément " + id + " existe")
  }else{
    console.error("L'élément " + id + " N'existe PAS")
  }
}
DOMElement.prototype.set = function(text){this.element.innerHTML = text}
DOMElement.prototype.clear = function(){this.set('')}
DOMElement.prototype.set_invisible = function(){this.element.style.visibility = "hidden"}
DOMElement.prototype.set_visible = function(){this.element.style.visibility = "visible"}
DOMElement.prototype.set_value = function(value){this.element.value = value}
