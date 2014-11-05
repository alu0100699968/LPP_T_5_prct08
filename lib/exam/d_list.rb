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
    if v.kind_of?(Array)
      for i in 0..v.size-1
          aux = @head
          nodo=Node.new(v[i], aux, nil)
          @head=nodo
          aux[:prev]=@head
      end
    else
      aux = @head
      nodo=Node.new(v, aux, nil)
      @head=nodo
      aux[:prev]=@head
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

  def to_is
    aux=@head
    s="Lista:  "
    while aux[:next] do
      aux=aux[:next]
    end
    while aux[:prev] do
      s = s + "#{aux[:value]}" + "  ->  "
      aux=aux[:prev]
    end
    s = s + "#{aux[:value]}"
    #puts "#{s}"
  end
end
