local numbering_depth = 3

function Header (h)
  if h.level > numbering_depth then 
    h.classes:insert 'unnumbered'
  end
  return h
end