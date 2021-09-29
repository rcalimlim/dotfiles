unlet b:current_syntax
syntax include @Yaml syntax/yaml.vim
syntax region yamlFrontmatter start=/\%^---/ end=/^---$/ keepend contains=@Yaml
set wrap
set wrapmargin=50
