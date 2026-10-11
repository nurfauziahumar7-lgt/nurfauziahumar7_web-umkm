<?php

include "koneksi.php";

header("Content-Type: application/json");

// ===============================
// JIKA MENGAMBIL DATA HARGA
// ===============================
if ($_SERVER["REQUEST_METHOD"] === "GET") {

    $sql = "SELECT nama_menu, harga FROM menu";

    $result = mysqli_query($conn, $sql);

    $data = [];

    while ($row = mysqli_fetch_assoc($result)) {

        $data[$row["nama_menu"]] = (int)$row["harga"];

    }

    echo json_encode([
        "status" => true,
        "data" => $data
    ]);

    mysqli_close($conn);
    exit;
}


// ===============================
// JIKA MENGEDIT HARGA
// ===============================
if ($_SERVER["REQUEST_METHOD"] === "POST") {

    $nama = $_POST["nama"] ?? "";
    $harga = $_POST["harga"] ?? "";

    if ($nama == "" || $harga == "") {

        echo json_encode([
            "status" => false,
            "pesan" => "Nama menu atau harga tidak ditemukan"
        ]);

        exit;
    }

    $harga = (int)$harga;

    if ($harga <= 0) {

        echo json_encode([
            "status" => false,
            "pesan" => "Harga tidak valid"
        ]);

        exit;
    }

    $stmt = mysqli_prepare(
        $conn,
        "UPDATE menu SET harga = ? WHERE nama_menu = ?"
    );

    mysqli_stmt_bind_param(
        $stmt,
        "is",
        $harga,
        $nama
    );

    if (mysqli_stmt_execute($stmt)) {

        echo json_encode([
            "status" => true,
            "pesan" => "Harga berhasil diubah"
        ]);

    } else {

        echo json_encode([
            "status" => false,
            "pesan" => "Gagal mengubah harga"
        ]);
    }

    mysqli_stmt_close($stmt);
    mysqli_close($conn);
    exit;
}


echo json_encode([
    "status" => false,
    "pesan" => "Metode request tidak dikenali"
]);

?>