# Defined via `source`
function grr --wraps='git reset --hard' --description 'alias grr git reset --hard'
  git reset --hard $argv; 
end
