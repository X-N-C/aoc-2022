mutable struct Node
    size::Int64
    children::Vector{Node}
    Node(n) = new(n, Node[])
    Node() = Node(0)
end

function drawtree(n, depth)
    println("  "^depth*string(n.size))
    return 0
end

function traverse_acc(f, a, depth, n::Node)
    a+=f(n, depth)
    for c in n.children
        a = traverse_acc(f, a, depth+1, c)
    end
    return a
end



function createfs()
    input = readlines("input")
    stack = Int64[1]
    root = Node()
    push!(root.children, Node())
    current = Node[root]
    for l in input
        if contains(l, "..")
            current[end].size = sum(n->n.size, current[end].children)
            pop!(current)
            pop!(stack)
            stack[end] += 1
        elseif startswith(l, "\$ cd")
            stack[end] = findfirst(n->n.size==0,current[end].children)
            push!(current, current[end].children[stack[end]])
            push!(stack, 1)
        elseif startswith(l, "dir")
            push!(current[end].children, Node())
        elseif !startswith(l, "\$ ls")
            push!(current[end].children, Node(parse(Int64, first(split(l)))))
        end
    end

    while !isempty(stack)
        current[end].size = sum(n->n.size, current[end].children)
        pop!(current)
        pop!(stack)
    end
    
    return root.children[1]
end

function small_directories(root)
    traverse_acc(drawtree, 0, 0, root)
    traverse_acc((n,d)->(!isempty(n.children)&&n.size<=100000)*n.size, 0, 0, root)
end

function traverse_app(f, a, depth, n::Node)
    if f(n)
        push!(a, n)
    end
    for c in n.children
        traverse_app(f, a, depth+1, c)
    end
    return nothing
end

function list_directories(root)
    a = Node[]
    traverse_app((n)->!isempty(n.children), a, 0, root)
    return a
end

function what_to_delete(root)
    threshold = 30_000_000-(70_000_000-root.size)
    dirs = list_directories(root)
    sort!(dirs, by = d -> d.size)
    dirs[findfirst(d -> d.size>threshold, dirs)].size
end


println(small_directories(createfs()))
println(what_to_delete(createfs()))
