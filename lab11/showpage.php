<?php
session_start();
include('cfg.php');

/* Ta funkcja przyjmuje argument id
następnie jeśli id nie jest null - pobierz z bazy danych zawartość odpowiedniej podstrony i zwraca jej zawartość
która może zostać wyświetlona */

function PokazPodstrone($id)
{
    global $link;
    if($id == null)
    {
      return "Nie znaleziono strony"; 
    }
    else
    {
      $id_clear = htmlspecialchars($id);
      $query="SELECT * FROM page_list WHERE id='$id_clear' LIMIT 1";
      $result=mysqli_query( $link,$query);
      $row=mysqli_fetch_array($result);

      if(empty($row['id']))
      {
        $web = '[nie_znaleziono_strony]';
      }
      else
      {
        $web=$row['page_content'];
      }
      return $web;
    }
    
}
?>