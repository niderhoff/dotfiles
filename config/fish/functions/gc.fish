# Defined via `source`
function gc --wraps='git checkout' --wraps='git commit' --description 'alias gc git commit'
  git commit $argv; 
end
