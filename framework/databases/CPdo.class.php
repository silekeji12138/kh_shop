<?php

class CPdo
{

    protected $_dsn = "";

    protected $_name = "";

    protected $_pass = "";

    protected $_condition = array();

    protected $pdo;

    protected $fetchAll;

    protected $query;

    protected $result;

    protected $num;

    protected $mode;

    protected $prepare;

    protected $row;

    protected $fetchAction;

    protected $beginTransaction;

    protected $rollback;

    protected $commit;

    protected $char;

    private static $get_mode;

    private static $get_fetch_action;

    /**
     * pdo construct
     */
    public function __construct($pconnect = false, $config = array())
    {
        // var_dump($config);die();
        $host = isset($config['host']) ? $config['host'] : 'localhost';
        $user = isset($config['user']) ? $config['user'] : 'root';
        $password = isset($config['password']) ? $config['password'] : '';
        $dbname = isset($config['dbname']) ? $config['dbname'] : '';
        $port = isset($config['port']) ? $config['port'] : '3306';
        $charset = isset($config['charset']) ? $config['charset'] : 'utf8';
        
        $this->_dsn = "mysql:host={$host};dbname={$dbname};port={$port}";
        
        $this->_name = $user;
        
        $this->_pass = $password;
        
        $this->_condition = array(
            PDO::ATTR_PERSISTENT => $pconnect
        );
        $this->pdo_connect();
        
        $this->setChars($charset);
    }

    /**
     * pdo connect
     */
    private function pdo_connect()
    {
        // echo $this->_dsn."<br/>". $this->_name."<br/>". $this->_pass."<br/>".$this->_condition."<br/>";
        try {
            $this->pdo = new PDO($this->_dsn, $this->_name, $this->_pass, $this->_condition);
        } catch (Exception $e) {
            return $this->setExceptionError($e->getMessage(), $e->getline, $e->getFile);
        }
    }

    /**
     * self sql get value action
     */
    public function getValueBySelfCreateSql($sql, $fetchAction = "assoc", $mode = null)
    {
        $this->fetchAction = $this->fetchAction($fetchAction);
        $this->result = $this->setAttribute($sql, $this->fetchAction, $mode);
        $this->AllValue = $this->result->fetchAll();
        return $this->AllValue;
    }

    /**
     * select condition can query
     */
    private function setAttribute($sql, $fetchAction, $mode)
    {
        $this->mode = self::getMode($mode);
        $this->fetchAction = self::fetchAction($fetchAction);
        $this->pdo->setAttribute(PDO::ATTR_CASE, $this->mode);
        $this->query = $this->base_query($sql);
        $this->query->setFetchMode($this->fetchAction);
        return $this->query;
    }

    /**
     * get mode action
     */
    private static function getMode($get_style)
    {
        switch ($get_style) {
            case null:
                self::$get_mode = PDO::CASE_NATURAL;
                break;
            case true:
                self::$get_mode = PDO::CASE_UPPER;
                break;
            case false:
                self::$get_mode = PDO::CASE_LOWER;
                break;
        }
        return self::$get_mode;
    }

    /**
     * fetch value action
     */
    private static function fetchAction($fetchAction)
    {
        switch ($fetchAction) {
            case "assoc":
                self::$get_fetch_action = PDO::FETCH_ASSOC; // asso array
                break;
            case "num":
                self::$get_fetch_action = PDO::FETCH_NUM; // num array
                break;
            case "object":
                self::$get_fetch_action = PDO::FETCH_OBJ; // object array
                break;
            case "both":
                self::$get_fetch_action = PDO::FETCH_BOTH; // assoc array and num array
                break;
            default:
                self::$get_fetch_action = PDO::FETCH_ASSOC;
                break;
        }
        return self::$get_fetch_action;
    }

    /**
     * get total num action
     */
    public function rowCount($sql)
    {
        $this->result = $this->base_query($sql);
        $this->num = $this->result->rowCount();
        return $this->num;
    }

    /*
     * simple query and easy query action
     */
    public function query($table, $column = "*", $condition = array(), $group = "", $order = "", $having = "", $startSet = "", $endSet = "", $fetchAction = "assoc", $params = null)
    {
        $sql = "select " . $column . " from `" . $table . "` ";
        if ($condition != null) {
            foreach ($condition as $key => $value) {
                $where .= "$key = '$value' and ";
            }
            $sql .= "where $where";
            $sql .= "1 = 1 ";
        }
        if ($group != "") {
            $sql .= "group by " . $group . " ";
        }
        if ($order != "") {
            $sql .= " order by " . $order . " ";
        }
        if ($having != "") {
            $sql .= " having {$having} ";
        }
        if (  is_numeric($endSet) && is_numeric($startSet)) {
            $sql .= "limit $startSet,$endSet";
        }
//        echo $sql;die();
        $this->result = $this->getValueBySelfCreateSql($sql, $fetchAction, $params);
        return $this->result;
    }

    /**
     * execute delete update insert and so on action
     */
    public function exec($sql)
    {
        $this->result = $this->pdo->exec($sql);
        $substr = substr($sql, 0, 6);
        if ($this->result) {
            return $this->successful($substr);
        } else {
            return $this->fail($substr);
        }
    }

    /**
     * prepare action
     */
    public function prepare($sql)
    {
        $this->prepare = $this->pdo->prepare($sql);
        // $this->setChars();
        $this->prepare->execute();
        while ($this->rowz = $this->prepare->fetch()) {
            return $this->row;
        }
    }

    /**
     * USE transaction
     */
    public function transaction($sql)
    {
        $this->begin();
        $this->result = $this->pdo->exec($sql);
        if ($this->result) {
            $this->commit();
        } else {
            $this->rollback();
        }
    }

    /**
     * start transaction
     */
    private function begin()
    {
        $this->beginTransaction = $this->pdo->beginTransaction();
        return $this->beginTransaction;
    }

    /**
     * commit transaction
     */
    private function commit()
    {
        $this->commit = $this->pdo->commit();
        return $this->commit;
    }

    /**
     * rollback transaction
     */
    private function rollback()
    {
        $this->rollback = $this->pdo->rollback();
        return $this->rollback;
    }

    /**
     * base query
     */
    private function base_query($sql)
    {
        // $this->setChars();
        $this->query = $this->pdo->query($sql);
        return $this->query;
    }

    /**
     * set chars
     */
    private function setChars($charest = "UTF8")
    {
        $this->char = $this->pdo->query("SET NAMES '{$charest}'");
        return $this->char;
    }

    /**
     * process sucessful action
     */
    private function successful($params)
    {
        return "The " . $params . " action is successful";
    }

    /**
     * process fail action
     */
    private function fail($params)
    {
        return "The " . $params . " action is fail";
    }

    /**
     * process exception action
     */
    private function setExceptionError($getMessage, $getLine, $getFile)
    {
        echo "Error message is " . $getMessage . "<br /> The Error in " . $getLine . " line <br /> This file dir on " . $getFile;
        exit();
    }
}

?>