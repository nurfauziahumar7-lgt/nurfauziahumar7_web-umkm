<?php

header("Content-Type: application/json");

include "koneksi.php";

$data = json_decode(file_get_contents("php://input"), true);

if (!$data) {
    echo json_encode([
        "status" => false,
        "pesan" => "Data tidak diterima oleh PHP"
    ]);
    exit;
}

if (!isset($data["nama"]) || !isset($data["pesanan"])) {
    echo json_encode([
        "status" => false,
        "pesan" => "Data nama atau pesanan tidak ada"
    ]);
    exit;
}

$nama = $data["nama"];
$pesanan = $data["pesanan"];

if ($nama == "" || count($pesanan) == 0) {
    echo json_encode([
        "status" => false,
        "pesan" => "Nama dan pesanan wajib diisi"
    ]);
    exit;
}

$total = 0;

foreach ($pesanan as $item) {

    $harga = (int) $item["harga"];
    $jumlah = (int) $item["jumlah"];

    $total += $harga * $jumlah;
}

$sql = "INSERT INTO pelanggan (nama, total, status)
        VALUES (?, ?, 'Diproses')";

$stmt = mysqli_prepare($conn, $sql);

if (!$stmt) {
    echo json_encode([
        "status" => false,
        "pesan" => "Gagal membuat data pelanggan: " . mysqli_error($conn)
    ]);
    exit;
}

mysqli_stmt_bind_param($stmt, "si", $nama, $total);

if (!mysqli_stmt_execute($stmt)) {
    echo json_encode([
        "status" => false,
        "pesan" => "Gagal menyimpan pelanggan: " . mysqli_stmt_error($stmt)
    ]);
    exit;
}

$pelanggan_id = mysqli_insert_id($conn);

foreach ($pesanan as $item) {

    $nama_menu = $item["nama"];
    $harga = (int) $item["harga"];
    $jumlah = (int) $item["jumlah"];
    $subtotal = $harga * $jumlah;

    $sqlPesanan = "INSERT INTO pesanan
                (pelanggan_id, nama_menu, harga, jumlah, subtotal)
                VALUES (?, ?, ?, ?, ?)";

    $stmtPesanan = mysqli_prepare($conn, $sqlPesanan);

    if (!$stmtPesanan) {
        echo json_encode([
            "status" => false,
            "pesan" => "Gagal membuat data pesanan: " . mysqli_error($conn)
        ]);
        exit;
    }

    mysqli_stmt_bind_param(
        $stmtPesanan,
        "isiii",
        $pelanggan_id,
        $nama_menu,
        $harga,
        $jumlah,
        $subtotal
    );

    if (!mysqli_stmt_execute($stmtPesanan)) {
        echo json_encode([
            "status" => false,
            "pesan" => "Gagal menyimpan menu: " . mysqli_stmt_error($stmtPesanan)
        ]);
        exit;
    }
}

echo json_encode([
    "status" => true,
    "pesan" => "Pesanan berhasil disimpan",
    "id" => $pelanggan_id
]);

?>