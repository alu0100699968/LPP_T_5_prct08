# create a Struct with :value, :next and :prev
Node = Struct.new(:value, :next, :prev)

# create a DList
class DList
  attr_accessor :head, :tail

  def initialize(v)
    if v.kind_of?(Array)
      @head = Node.new(v[0],nil, nil)
      v.shift
      push(v)
    else
      @head = Node.new(v, nil, nil)
    end
  end

  def popHead
    nodo = @head
    @head=@head[:next]
    @head[:prev]=nil
    return nodo[:value]
  end

  def push(v)
    aux = @head
    nodo=Node.new(v, aux, nil)
    @head=nodo
    aux[:prev]=@head
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
