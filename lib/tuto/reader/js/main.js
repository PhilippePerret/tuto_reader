
const DUREE_LECTURE_MOT = #{tuto.options[:duree_lecture_mot]};
const PHRASES = #{tuto.script.javascript_phrases};


var speed = 10;
window.show_speed = function(){
  document.getElementById('speed').innerHTML = speed;
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
window.quick_forward = function(){}
window.quick_backward = function(){}

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
    this.bouton_start.set('⏸');
  },
  pause:function(){
    TutoReader.running = false;
    clearTimeout(TutoReader.timer);
    this.bouton_start.set('⏺');
  },
  stop:function(){
    this.pause();
    this.bouton_stop.set_invisible();
    this.iphrase = 0 ;
  },

  affiche_phrase_courante:function(){
    if(TutoReader.iphrase == PHRASES.length){
      TutoReader.iphrase = 0;
      document.getElementById('reader_next_phrase').innerHTML = "FIN"
      return TutoReader.stop();
    }
    var prev_phrase = PHRASES[TutoReader.iphrase - 1] || '';
    var next_phrase = PHRASES[TutoReader.iphrase + 1];
    if(next_phrase == undefined){next_phrase = ''};
    document.getElementById('reader_prev_phrase').innerHTML = prev_phrase;
    document.getElementById('reader_curr_phrase').innerHTML = this.phrase_courante.content();
    document.getElementById('reader_next_phrase').innerHTML = next_phrase;
    TutoReader.timer = setTimeout("TutoReader.next_phrase()", this.phrase_courante.duree_lecture());
    document.getElementById('index_phrase').innerHTML = TutoReader.iphrase;
    document.getElementById('duree_phrase').innerHTML = TutoReader.phrase_courante.duree_lecture();
    console.log("Nombre de mots : " + this.phrase_courante.nombre_mots());
  },
  next_phrase: function(){
    TutoReader.iphrase += 1 ;
    TutoReader.affiche_phrase_courante();
  },
  phrase_courante: {
    content: function(){return PHRASES[TutoReader.iphrase]},
    nombre_mots: function(){return this.content().split(' ').length},
    duree_lecture:function(){return this.nombre_mots() * DUREE_LECTURE_MOT * 10/speed}
  },

  # ---------------------------------------------------------------------
  # Le bouton stop
  # ---------------------------------------------------------------------
  bouton_stop: {
    set_invisible: function(){
      this.element().style.visibility = 'hidden'
    },
    set_visible: function(){
      this.element().style.visibility = 'visible'
    },
    element:function(){return document.getElementById('btn_stop')}
  },
  # ---------------------------------------------------------------------
  #   BOUTON START / PAUSE
  # ---------------------------------------------------------------------
  bouton_start:{
    element:function(){return document.getElementById('btn_start')},
    set:function(value){this.element().value = value}
  }
}
