
const SCRIPT_FILE_PATH  = "<%= tuto.script.path %>";
const DUREE_LECTURE_MOT = <%= tuto.options[:duree_lecture_mot] %>;
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

// ---------------------------------------------------------------------

var speed = 10;
window.show_speed = function(){
  TutoRead.span_speed.set(speed)
}
window.increase_speed = function(){
  speed += 1 ;
  show_speed();
}
window.decrease_speed = function(){
  speed -= 1 ;
  show_speed();
}
window.start = function(){
  TutoReader.start_or_pause();
}
window.stop = function(){TutoReader.stop()}
window.quick_forward = function(){
  TutoReader.forward();
}
window.quick_backward = function(){
  TutoReader.backward();
}

window.TutoReader = {

  running: false,
  iphrase: 0,


  start_or_pause: function(){
    if(this.running){TutoReader.pause()}
    else {TutoReader.start()}
  },
  start:function(){
    this.running = true;
    this.bouton_stop.set_visible();
    this.affiche_phrase_courante();
    this.bouton_start.set_value('⏸');
  },
  pause:function(){
    TutoReader.running = false;
    clearTimeout(TutoReader.timer);
    this.bouton_start.set_value('⏺');
  },
  stop:function(){
    this.pause();
    this.bouton_stop.set_invisible();
    this.iphrase = 0 ;
  },

  // On revient en arrière
  backward:function(){
    this.pause();
    this.iphrase -= 1;
    this.start();
  },
  // On avance d'une phrase sans attendre
  forward:function(){
    this.pause();
    this.iphrase += 1;
    this.start();
  },

  span_speed:         new DOMElement('speed'),
  bouton_stop:        new DOMElement('btn_stop'),
  bouton_start:       new DOMElement('btn_start'),
  div_next_phrase:    new DOMElement('reader_next_phrase'),
  div_prev_phrase:    new DOMElement('reader_prev_phrase'),
  div_curr_phrase:    new DOMElement('reader_curr_phrase'),
  span_index_phrase:  new DOMElement('index_phrase'),
  span_duree_phrase:  new DOMElement('duree_phrase'),
  span_edit_phrase:   new DOMElement('edit_link'),

  affiche_phrase_courante:function(){
    if(TutoReader.iphrase == PHRASES.length){
      TutoReader.iphrase = 0;
      this.div_next_phrase.set('FIN')
      return TutoReader.stop();
    }
    var prev_phrase = PHRASES[TutoReader.iphrase - 1];
    if(undefined == prev_phrase){prev_phrase = ''}
    else{prev_phrase = prev_phrase.line_text}
    var next_phrase = PHRASES[TutoReader.iphrase + 1];
    if(next_phrase == undefined){next_phrase = ''}
    else{next_phrase  = next_phrase.line_text}
    this.div_prev_phrase.set(prev_phrase);
    this.div_curr_phrase.set(this.phrase_courante.content());
    this.span_edit_phrase.set(this.phrase_courante.edit_link());
    this.div_next_phrase.set(next_phrase);
    TutoReader.timer = setTimeout("TutoReader.next_phrase()", this.phrase_courante.duree_lecture());
    this.span_index_phrase.set(TutoReader.iphrase);
    this.span_duree_phrase.set(TutoReader.phrase_courante.duree_lecture())
  },
  next_phrase: function(){
    TutoReader.iphrase += 1 ;
    TutoReader.affiche_phrase_courante();
  },
  phrase_courante: {
    hphrase: function(){return PHRASES[TutoReader.iphrase]},
    content: function(){return this.hphrase().line_text},
    nombre_mots: function(){return this.content().split(' ').length},
    duree_lecture:function(){return this.nombre_mots() * DUREE_LECTURE_MOT * 10/speed},
    edit_link: function(){
      href = "atm://open?url=file://"+SCRIPT_FILE_PATH+"&line=" + this.hphrase().line_index;
      return '<a href="'+href+'">[edit]</a>'
    }
  }

}
