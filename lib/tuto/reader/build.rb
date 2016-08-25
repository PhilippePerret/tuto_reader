# encoding: UTF-8
class Tuto
class Reader

  # = main =
  #
  # Construction du reader de tutoriel d'après son script
  def build
    File.unlink path if File.exist? path
    File.open(path,'wb'){ |f| f.write code_reader }
    return self
  end

  # = main =
  #
  # Retourne tout le code HTML à copier dans le fichier reader
  def code_reader
    '<html>' +
        head + body + foot +
    '</html>'
  end

  def head
    '<head>'            +
      balise_encoding   +
      balise_title      +
      balise_javascript +
      balise_css        +
    '</head>'
  end
  def body
    '<body>'            +
      div_titre         +
      div_reader        +
      div_boutons       +
    '</body>'
  end
  def foot
    ''
  end

  # ---------------------------------------------------------------------

  def balise_encoding
    '<meta http-equiv="Content-type" content="text/html; charset=utf-8">'
  end
  def balise_title
    "<title>#{options[:titre]}</title>"
  end
  def balise_javascript
    <<-JSS
<script type="text/javascript">

const DUREE_LECTURE_MOT = 500 ; // nombre de secondes par mots
const PHRASES = ["Une phrase", "une autre phrase très longue pour voir le nombre de mots qui sera lu.", "Une troisième phrase"] ;


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
  TutoReader.start_or_stop();
}
window.quick_forward = function(){}
window.quick_backward = function(){}

window.TutoReader = {

  running: false,
  iphrase: 0,


  start_or_stop: function(){
    if(TutoReader.running){TutoReader.stop()}
    else {TutoReader.start()}
  },
  start:function(){
    TutoReader.running = true;
    TutoReader.affiche_phrase_courante();
    document.getElementById('btn_start').value = '⏹';
  },
  stop:function(){
    TutoReader.running = false;
    clearTimeout(TutoReader.timer);
    document.getElementById('btn_start').value = '⏺';
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
  }
}

</script>
    JSS
  end
  def balise_css
    <<-CSSS
<style type="text/css">
body{
  width:      800px;
  font-size:  17pt;
}
div#boutons{
  text-align: right;
}
div#boutons input[type="button"] {
    background-color: inherit;
    border: 0 none;
    font-size: 29pt;
    padding: 0;
}
span#speed{
  display:inline-block;
  width: 140px;
  text-align: center;
}
span#speed:before{content:"Vitesse : "}

div#reader {
  height: 180px;
  min-height: 180px;
  max-height: 180px;
  font-size:  26pt;
}
div#reader div#reader_curr_phrase{
  font-weight: bold;
  color: blue;
  font-size: 1.2em;
  height:  60px;
}
div#reader div#reader_prev_phrase, div#reader div#reader_next_phrase{
  color: #CCC;
  height:  60px;
}

</style>
    CSSS
  end

  # ---------------------------------------------------------------------

  def div_titre
    "<h1>Tuto reader pour : </h1>"
  end

  def div_reader
    '<div id="reader">' +
      '<div id="reader_prev_phrase"></div>' +
      '<div id="reader_curr_phrase"></div>' +
      '<div id="reader_next_phrase"></div>' +
    '</div>'
  end
  def div_boutons
    '<div id="boutons">'+
      '<span>Phrase : <span id="index_phrase"></span> (<span id="duree_phrase"></span>)</span>' +
      '<input type="button" value="-" onclick="decrease_speed()" />'        +
      '<span id="speed"><script>document.write(speed);</script></span>'     +
      '<input type="button" value="+" onclick="increase_speed()" />'        +
      '<input type="button" value="⏪" onclick="quick_backward()" />'        +
      '<input type="button" id="btn_start" value="⏺" onclick="start()" />'   +
      '<input type="button" value="⏩" onclick="quick_forward()" />'        +
    '</div>'
  end

  # ---------------------------------------------------------------------


end #/Reader
end #/Tuto
