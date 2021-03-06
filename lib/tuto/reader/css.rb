# encoding: UTF-8
class Tuto
class Reader

  def balise_css
    <<-CSSS
<style type="text/css">
#{self.code_css}
</style>
    CSSS
  end


  # Le code CSS
  def code_css
    require 'sass'
    data_compilation = { line_comments: false, style: :compressed, syntax: :sass }
    Sass.compile(self.sass, data_compilation) +
    Sass.compile(self.sass_top_boutons, data_compilation) +
    Sass.compile(self.sass_action, data_compilation) +
    Sass.compile(self.sass_reader, data_compilation) +
    Sass.compile(self.sass_div_audio, data_compilation) +
    Sass.compile(self.sass_infos, data_compilation) +
    Sass.compile(self.sass_boutons, data_compilation)
  end

  # La feuille de style SASS
  def sass
    <<-SASS
body
  position    : relative
  font-size   : 17pt
  background-color  : #3e3e3e
  color             : white
  padding           : 0
  margin            : 0

  h1
    background-color    : black
    color               : white
    font-weight         : normal
    font-size           : 18pt
    padding             : 4px 24px
    margin              : 0

    span#state
      float       : right
      color       : #00ff00
      font-size   : 14.7pt
      margin-top  : 6px

  span#speed
    display     : inline-block
    width       : 140px
    text-align  : center

    &:before
      content   : "Vitesse : "

    SASS
  end

  def sass_top_boutons
    <<-SASS
body
  div#top_boutons
    text-align  : right
    SASS
  end
  def sass_action
    <<-SASS
div#action
  margin        : 0
  padding       : 1
  font-family   : Courier
  font-size     : 12pt
  padding       : 0 1em
    SASS
  end
  def sass_reader
    <<-SASS
body
  div#reader
    font-size   : 26pt
    width       : 90%
    margin-left   : 1em
    margin-right  : 1em
    position    : absolute
    // border      : 1px dashed green
    top         : 100px
    background-color    : white
    padding     : 0.5em

    div#reader_curr_phrase
      font-weight   : bold
      color         : blue
      font-size     : 1.2em
      height        : auto
      // border        : 1px dashed red
      width         : 100%
      margin        : 1em 0
    div#reader_prev_phrase
      width         : 100%
      color         : #999
    div#reader_next_phrase
      color         : #CCC
      width         : 100%

    SASS
  end
  def sass_div_audio
    <<-SASS
div#div_audio
  position    : fixed
  bottom      : 0
  left        : 0
  padding     : 0.5em 1em
  background-color  : black
  color             : white

  input[type="button"]
    background-color    : inherit
    color               : inherit
    border              : 0 none
    font-size           : 29pt
    padding             : 0


    SASS
  end
  def sass_boutons
    <<-SASS
body
  div#boutons
    text-align  : right
    position    : fixed
    width       : 500px
    bottom      : 0
    right       : 0
    //border      : 1px dashed green
    padding     : 0.5em 2em
    background-color  : #303030
    color             : white

    div#div_speed
      float       : left
      span#speed

    input[type="button"]
      background-color    : inherit
      color               : inherit
      border              : 0 none
      font-size           : 29pt
      padding             : 0
    SASS

  end
  # /sass_boutons

  def sass_infos
    <<-SASS
body
  div#infos
    position          : fixed
    bottom            : 0
    left              : 0
    background-color  : black
    color             : white
    padding           : 0.5em 1em
    font-size         : 12pt
    min-width         : 300px
    SASS
  end

end #/Reader
end #/Tuto
=begin


=end
