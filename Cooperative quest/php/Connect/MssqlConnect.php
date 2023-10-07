<?php
class MssqlConnect // Создаем класс MssqlConnect
{
    private $db_host = 'localhost';  //Подключаемся к базе
    private $db_port = '1433'; //Подключаемся к базе
    private $db_user = 'sa'; //Подключаемся к базе
    private $db_pass = '123456'; //Подключаемся к базе
    public $db=null; // обьявляем публичный класс

    public function __construct() // Создаем конструктор для инициализации св-в обьектов
    {
        try {
            $this->db = new PDO("sqlsrv:Server={$this->db_host}, {$this->db_port}", $this->db_user, $this->db_pass);
            if ($this->db);
   //             echo "подключение к базе данных успешно";
        } catch (PDOException $e) {
            error_log("немогу подключиться к бд", "error.log");
            echo "нет подключения к базе данных";
        }

    }
    public function fetch_array(string $sql){
        $sth=$this->db->prepare($sql);
        $sth->execute();
        return $sth->fetch(PDO::FETCH_BOTH);

    }
    public function fetch_all(string $sql){
        $sth=$this->db->prepare($sql);
        $sth->execute();
        return $sth->fetchAll();

    }
}
