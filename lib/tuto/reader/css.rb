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
    Sass.compile(self.sass_reader, data_compilation) +
    Sass.compile(self.sass_infos, data_compilation) +
    Sass.compile(self.sass_boutons, data_compilation)
  end

  # La feuille de style SASS
  def sass
    <<-SASS
body
  position    : relative
  // width       : 800px
  font-size   : 17pt

  span#speed
    display     : inline-block
    width       : 140px
    text-align  : center

    &:before
      content   : "Vitesse : "

    SASS
  end

  def sass_reader
    <<-SASS
body
  div#reader
    height  : 180px
    min-height  : 180px
    max-height  : 180px
    font-size   : 26pt
    min-width   : 100%
    width       : 100%
    position    : absolute
    border      : 1px dashed green
    top         : 100px

    div#reader_curr_phrase
      font-weight   : bold
      color         : blue
      font-size     : 1.2em
      height        : auto
      border        : 1px dashed red
      width         : 100%
    div#reader_prev_phrase
      bottom        : 100px
      height        : auto
      width         : 100%
      color         : #999
    div#reader_next_phrase
      height        : auto
      color         : #CCC
      width         : 100%

    SASS
  end
  def sass_boutons
    <<-SASS
body
  div#boutons
    text-align  : right
    position    : fixed
    bottom      : 0
    right       : 0
    border      : 1px dashed green

    input[type="button"]
      background-color    : inherit
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
    SASS
  end

end #/Reader
end #/Tuto
=begin


=end
