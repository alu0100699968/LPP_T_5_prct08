# create a Struct with :value, :next and :prev (for DList)
Node = Struct.new(:value, :next, :prev)

class List
  attr_accessor :head

  def initialize(v)
    if v.kind_of?(Array)
      @head = Node.new(v[0],nil)
      v.shift
      push(v)
    else
      @head = Node.new(v, nil)
    end
  end

  def popHead
  	nodo = @head
    @head=@head[:next]
    return nodo[:value]
  end

  def push(v)
    aux = @head
    if v.kind_of?(Array)
      for i in 0..v.size-1
        a=v[i]
        while aux[:next]!=nil do
          aux=aux[:next]
        end
        nuevo_nodo=Node.new(a, nil)
        aux[:next]=nuevo_nodo
      end
    else
      while aux[:next] do
        aux=aux[:next]
      end
      nuevo_nodo=Node.new(v, nil)
      aux[:next]=nuevo_nodo
    end
  end

  def to_s
    aux=@head
    s="Lista:  "
    while aux[:next] do
      s = s + "#{aux[:value]}" + "  ->  "
      aux=aux[:next]
    end
    s = s + "#{aux[:value]}"
    #puts "#{s}"
  end

end
