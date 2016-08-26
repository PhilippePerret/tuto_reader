var file_audio = document.getElementById('actions_audio');
var btn_audio_play = new DOMElement('btn_audio_play');
var btn_audio_stop = new DOMElement('btn_audio_stop');

var audio_running = false ;

window.start_action_audio = function(){
  if(audio_running){
    pause_action_audio();
  }else{
    file_audio.play();
    btn_audio_stop.set_visible();
    btn_audio_play.set_value('⏸');
  }
  audio_running = !audio_running ;
}
window.stop_action_audio = function(){
  audio_running = true ;
  file_audio.pause();
  btn_audio_play.set_value('⏺');
  btn_audio_stop.set_invisible();
}
window.pause_action_audio = function(){
  file_audio.pause();
  btn_audio_play.set_value('⏺');
}
btn_audio_stop.set_invisible();
