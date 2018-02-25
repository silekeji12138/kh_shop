<?php
// 模型类基类
class ModelNew
{
    // 数据库连接对象
    protected $db;

    /**
     * 20180122
     * ghy
     * 链式查询参数
     */
    // 表的主键
    protected $pk = "id";

    protected $table;

    protected $column = "*";

    protected $condition = array();

    protected $group;

    protected $order;

    protected $having;

    protected $startSet;

    protected $endSet;
    
    
    //查询返回结果
    protected $result = array();
    

    public function __construct()
    {
        $dbconfig['host'] = $GLOBALS['config']['host'];
        $dbconfig['user'] = $GLOBALS['config']['user'];
        $dbconfig['password'] = $GLOBALS['config']['password'];
        $dbconfig['dbname'] = $GLOBALS['config']['dbname'];
        $dbconfig['port'] = $GLOBALS['config']['port'];
        $dbconfig['charset'] = $GLOBALS['config']['charset'];
        // var_dump($dbconfig);die();
        $this->db = new CPdo(false, $dbconfig);
//        $this->table = $GLOBALS['config']['prefix'] ;
    }

    /**
     * 获取表主键
     */
    private function getPK()
    {
        if ($this->table != $GLOBALS['config']['prefix'] && ! empty($this->table)) {
            $sql = "DESC " . $this->table;
            
            $result = $this->db->getValueBySelfCreateSql($sql);
            foreach ($result as $v) {
                $this->fields[] = $v['Field'];
                if ($v['Key'] == 'PRI') {
                    // 如果存在主键的话，则将其保存到变量$pk中
                    $pk = $v['Field'];
                }
            }
            // 如果存在主键，则将其加入到字段列表fields中
            if (isset($pk)) {
                $this->pk = $pk;
            }
            // echo $this->pk;
        }
    }

    /**
     * 设置模型的表明
     * 
     * @param unknown $table            
     */
    public function M($table)
    {
        $table = str_replace($GLOBALS['config']['prefix'], "", $table);
        $this->table = $GLOBALS['config']['prefix'] . $table;
        // 设置主键
        $this->getPK();
        return $this;
    }

    /**
     * 筛选返回字段
     * @param string $column
     */
    public function find($column = '*')
    {
        $this->column = $column;
        return $this;
    }

    /**
     * 初始化条件
     * @param unknown $condition
     */
    public function where($condition = array())
    {
        $this->condition = $condition;
        return $this;
    }

    /**
     * 增加条件
     * @param unknown $condition
     */
    public function andwhere($condition = array())
    {
        if (count($this->$condition) == 0) {
            $this->condition = $condition;
        } else {
            $this->condition = $this->$condition + $condition;
        }
        
        return $this;
    }

    /**
     * having字句可以让我们筛选成组后的各种数据，where字句在聚合前先筛选记录，也就是说作用在group by和having字句前。而 having子句在聚合后对组记录进行筛选。
     * 
     * @param string $column            
     */
    public function having($having)
    {
        if($this->having=="" || empty($this->having ))
        {
            $this->having = $having;
        }else 
        {
            $this->having =$this->having. " and " . $having;
            
        }
       
        return $this;
    }

    /**
     * 此方法是排序查询；
     * @param string $order
     */
    public function orderBy($order = '{$this->pk} desc')
    {
        $this->order = $order;
        return $this;
    }
    
    /**
     * 此方法是group查询；
     * @param string $order
     */
    public function groupBy($group = '')
    {
        $this->group = $group;
        $this->column = $group;
        return $this;
    }

    /**
     * 设置返回数量
     * 
     * @param number $startSet            
     * @param number $endSet            
     */
    public function limit($startSet = 0, $endSet = 10)
    {
        $this->startSet = $startSet;
        $this->endSet = $endSet;
        return $this;
    }

    /**
     * 返回所有
     */
    public function all()
    {      
        if(count($this->result)==0)
        {
            $result = $this->do_sql();
        
        }else
        {
            $result=$this->result;
        
        }
        
        return $result;
    }
    
    /**
     * 执行查询
     */
    private function do_sql()
    {
        
        $result = $this->db->query($this->table, $this->column, $this->condition, $this->group, $this->order, $this->having, $this->startSet, $this->endSet, "assoc",null);
        return $result;
    }
    
    
    /**
     * 返回主键的值等于 $pk_val的记录
     * @param unknown $pk_val
     */
    public function findOne($pk_val)
    {
        $this->condition = [$this->pk => $pk_val];
        $result = $this->all();
        return $result[0];
    }
    
    
    
    /**
     * 此方法返回记录的数量
     */
    public function count()
    {
        if(count($this->result)==0)
        {
            $result = $this->all();
            
        }else
        {
            $result=$this->result;
        
        }
        
        $num = count($result);
        return $num;
        
    }
    
    /**
     * 此方法返回一条数据
     */
    public function one()
    {
        if(count($this->result)==0)
        {
            $this->startSet = 0;
            $this->endSet = 1;
            $result = $this->all();
        }else 
        {
            $result=$this->result;
            
        }
        
        return $result[0];
    }
    
    
    /**
     * 此方法是用 sql  语句查询 ；
     * @param unknown $sql_str
     */
    public function findBySql($sql_str)
    {
        $result = $this->db->getValueBySelfCreateSql($sql_str);
        $this->result = $result;
        return $this;
    }
    
    
    /**
     *  此方法是用 like , in , <> 查询 数据
     * @param unknown $condition
     */
    public function andFilterWhere($condition = array())
    {
       //['like', 'name', '小伙儿']
       $_condition = $condition[0];
       $_k = $condition[1];
       $_v = $condition[2];
       
       if($_condition=="like")
       {
       $_having_str = " {$_k} {$_condition} '%{$_v}%' ";    
       }
       
       if($_condition=="<>")
       {
           $_having_str = " {$_k} {$_condition} '{$_v}' ";
       }
       
       if($_condition=="in")
       {
           $_having_str = " {$_k} {$_condition} ({$_v}) ";
       }
       $this->having($_having_str);
       
        return $this;
    }
    
    
    
}