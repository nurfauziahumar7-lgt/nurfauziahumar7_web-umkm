<?php

header("Content-Type: application/json");

include "koneksi.php";

$id = $_POST["id"] ?? "";

if ($id == "") {
    echo json_encode([
        "status" => false,
        "pesan" => "ID tidak ditemukan"
    ]);
    exit;
}

$stmt = mysqli_prepare(
    $conn,
    "DELETE FROM pelanggan WHERE id = ?"
);

mysqli_stmt_bind_param(
    $stmt,
    "i",
    $id
);

if (mysqli_stmt_execute($stmt)) {

    echo json_encode([
        "status" => true,
        "pesan" => "Data berhasil dihapus"
    ]);

} else {

    echo json_encode([
        "status" => false,
        "pesan" => "Gagal menghapus data"
    ]);
}

?>