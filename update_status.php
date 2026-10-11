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
    "UPDATE pelanggan SET status = 'Selesai' WHERE id = ?"
);

mysqli_stmt_bind_param($stmt, "i", $id);

if (mysqli_stmt_execute($stmt)) {

    echo json_encode([
        "status" => true,
        "pesan" => "Pesanan berhasil diselesaikan"
    ]);

} else {

    echo json_encode([
        "status" => false,
        "pesan" => "Gagal mengubah status"
    ]);
}

mysqli_stmt_close($stmt);
mysqli_close($conn);

?>