module kiwi.core.context;

import kiwi.core.commons;
import kiwi.core.datafactory;
import kiwi.core.nodefactory;
import kiwi.core.nodeinfo;
import kiwi.core.pipeline;

struct Context
{   
    this( DataFactory df, NodeFactory nf = new NodeFactory )
    {
        _dataFactory = df;
        _nodeFactory = nf;
    }
    
    NodeTypeID registerNodeType( NodeTypeInfo info )
    {
        return nodeFactory.registerNodeType( info );
    }
    
    bool unregisterNodeType( NodeTypeID type )
    {
        return nodeFactory.unregisterNodeType( type );
    }
    
    @property 
    {
        NodeFactory nodeFactory() { return _nodeFactory; }
        DataFactory dataFactory() { return _dataFactory; }
    }
    
    Pipeline* pipeline(PipelineID pid)
    {
        return &_pipelines[pid];
    }
private:
    DataFactory _dataFactory;
    NodeFactory _nodeFactory;
    Pipeline[PipelineID] _pipelines;
}



// TODO move ID structs in another module ? 


struct PipelineID
{
    this(ushort idx)
    {
        index = idx;
    }
    ushort index;
}

struct NodeID
{
    this(PipelineID p, ushort idx)
    {
        pipeline = p;
        index    = idx;
    }
    PipelineID  pipeline;
    ushort      index;
}

struct InputPortID
{
    this(NodeID n, ubyte idx)
    {
        node    = n;
        index   = idx;
    }
    NodeID node;
    ubyte  index;
}

struct OutputPortID
{
    this(NodeID n, ubyte idx)
    {
        node    = n;
        index   = idx;
    }
    NodeID node;
    ubyte  index;
}


unittest
{
    import kiwi.utils.testing;
    auto unit = TestSuite("kiwi.core.context");


}
