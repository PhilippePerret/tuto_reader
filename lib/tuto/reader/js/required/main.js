
// ---------------------------------------------------------------------

window.edit_phrase_courante = function(){
  TutoReader.pause();
  TutoReader.phrase_courante.edit();
}
var speed = 10;
window.show_speed = function(){
  TutoReader.span_speed.set(speed)
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

/** ---------------------------------------------------------------------
  *
  *   OBJET TUTOREADER
  *
  ---------------------------------------------------------------------*/
window.TutoReader = {

  running: false,
  iphrase: 0,

  // Sert à l'ouverture + à chaque fois qu'on stoppe
  init:function(){
    this.bouton_stop.set_invisible();
    this.iphrase = 0;
    this.btn_edit_phrase.set_invisible();
    this.span_state.clear();
    this.div_next_phrase.clear();
    this.div_prev_phrase.clear();
    this.div_curr_phrase.set('Lancement lecture : ⏺.' )
    this.bouton_backward.set_invisible();
  },

  start_or_pause: function(){
    if(this.running){TutoReader.pause()}
    else{TutoReader.start()}
  },
  start:function(){
    this.running = true;
    this.bouton_stop.set_visible();
    this.affiche_phrase_courante();
    this.bouton_start.set_value('⏸');
    this.btn_edit_phrase.set_visible();
    this.span_state.set("Lecture…");
  },
  pause:function(){
    TutoReader.running = false;
    this.span_state.set('PAUSE');
    clearTimeout(TutoReader.timer);
    this.bouton_start.set_value('⏺');
  },
  stop:function(){
    TutoReader.running = false;
    clearTimeout(TutoReader.timer);
    this.bouton_start.set_value('⏺');
    this.init();
  },

  // On revient en arrière
  backward:function(){
    if(this.iphrase == 0){return}
    this.pause();
    this.iphrase -= 1;
    this.start();
  },
  // On avance d'une phrase sans attendre
  forward:function(){
    if(this.iphrase == PHRASES.length){return}
    this.pause();
    this.iphrase += 1;
    this.start();
  },

  span_state:         new DOMElement('state'),
  span_speed:         new DOMElement('speed'),
  bouton_stop:        new DOMElement('btn_stop'),
  bouton_start:       new DOMElement('btn_start'),
  bouton_backward:    new DOMElement('btn_backward'),
  bouton_forward:     new DOMElement('btn_forward'),
  div_next_phrase:    new DOMElement('reader_next_phrase'),
  div_prev_phrase:    new DOMElement('reader_prev_phrase'),
  div_curr_phrase:    new DOMElement('reader_curr_phrase'),
  div_action:         new DOMElement('action'),
  span_index_phrase:  new DOMElement('index_phrase'),
  span_duree_phrase:  new DOMElement('duree_phrase'),
  btn_edit_phrase:    new DOMElement('btn_edit_phrase'),

  affiche_phrase_courante:function(){
    if(TutoReader.iphrase == PHRASES.length){
      TutoReader.iphrase = 0;
      this.div_next_phrase.set('FIN')
      return TutoReader.stop();
    }
    // Instancier la phrase courante (cela définir le contenu,
    // l'action - if any - etc.)
    this.phrase_courante.init();

    var prev_phrase = PHRASES[TutoReader.iphrase - 1];
    if(undefined == prev_phrase){prev_phrase = ''}
    else{prev_phrase = prev_phrase.line_text}
    var next_phrase = PHRASES[TutoReader.iphrase + 1];
    if(next_phrase == undefined){next_phrase = ''}
    else{next_phrase  = next_phrase.line_text}
    this.div_prev_phrase.set(prev_phrase);
    this.div_curr_phrase.set(this.phrase_courante.content);
    this.div_next_phrase.set(next_phrase);
    TutoReader.timer = setTimeout("TutoReader.next_phrase()", this.phrase_courante.duree_lecture);
    this.span_index_phrase.set(TutoReader.iphrase);
    this.span_duree_phrase.set(TutoReader.phrase_courante.duree_lecture)
    if (this.iphrase > 0){this.bouton_backward.set_visible()}
    else{this.bouton_backward.set_invisible()}
    if(this.iphrase < PHRASES.length - 1){this.bouton_forward.set_visible()}
    else{this.bouton_forward.set_invisible()}

    // Y a-t-il une action à accomplir en même temps
    if(this.phrase_courante.action){
      this.div_action.set("ACTION : " + this.phrase_courante.action)
    }else{
      this.div_action.clear();
    }
  },
  next_phrase: function(){
    TutoReader.iphrase += 1 ;
    TutoReader.affiche_phrase_courante();
  },
  phrase_courante: {
    content: null,
    action:  null,
    edit: function(){
      href = "txmt://open?url=file://"+SCRIPT_FILE_PATH+"&line=" + this.hphrase.line_index;
      wnd = window.open(href, 'pour');
      wnd.close();
    },
    init:function(){
      this.hphrase        = PHRASES[TutoReader.iphrase];
      this.content        = this.hphrase.line_text;
      this.action         = this.hphrase.line_action;
      this.nombre_mots    = this.content.split(' ').length;
      this.duree_lecture  = this.nombre_mots * DUREE_LECTURE_MOT * 10/speed;
    }
  }

}

TutoReader.init();
