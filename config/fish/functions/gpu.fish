# Defined via `source`
function gpu --wraps='git push' --description 'alias gpu git push'
  git push $argv; 
end
