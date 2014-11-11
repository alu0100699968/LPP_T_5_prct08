#Require para utilizar el Struct Node
require 'exam/list.rb'

# create a DList
class DList

  include Enumerable

  attr_accessor :head, :tail

  def each
  	aux=@head
  	while aux[:next]
  		yield aux[:value]
  		aux=aux[:next]
  	end
  	yield aux[:value]
  end


  def initialize(v)
    if v.kind_of?(Array)
      @head = Node.new(v[0],nil, nil)
      v.shift
      pushHead(v)
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

  def popTail
  	nodo = @head
  	while nodo[:next] do
      nodo=nodo[:next]
    end
    aux=nodo[:prev]
    aux[:next]=nil
    nodo[:prev]=nil
    return nodo[:value]
  end

  def pushHead(v)
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

    def pushTail(v)
	    aux = @head

	    if v.kind_of?(Array)
	      for i in 0..v.size-1
	        while aux[:next]!=nil do
	          aux=aux[:next]
	        end
	        nuevo_nodo=Node.new(v[i], nil, aux)
	        aux[:next]=nuevo_nodo
	      end
	    else
	      while aux[:next] do
	        aux=aux[:next]
	      end
	      nuevo_nodo=Node.new(v, nil, aux)
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
