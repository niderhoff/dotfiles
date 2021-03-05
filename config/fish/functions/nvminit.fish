# Defined via `source`
function nvminit --wraps='node --version >.nvmrc' --description 'alias nvminit=node --version >.nvmrc'
  node --version >.nvmrc $argv; 
end
