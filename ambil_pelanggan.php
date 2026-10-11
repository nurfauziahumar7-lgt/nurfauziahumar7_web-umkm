<?php

header("Content-Type: application/json");

include "koneksi.php";

$sql = "
    SELECT
        pelanggan.id,
        pelanggan.nama,
        pelanggan.total,
        pelanggan.status,
        pelanggan.tanggal,
        pesanan.nama_menu,
        pesanan.harga,
        pesanan.jumlah,
        pesanan.subtotal
    FROM pelanggan
    LEFT JOIN pesanan
        ON pelanggan.id = pesanan.pelanggan_id
    ORDER BY pelanggan.id DESC
";

$result = mysqli_query($conn, $sql);

$data = [];

while ($row = mysqli_fetch_assoc($result)) {

    $id = $row["id"];

    if (!isset($data[$id])) {

        $data[$id] = [
            "id" => $row["id"],
            "nama" => $row["nama"],
            "total" => $row["total"],
            "status" => $row["status"],
            "tanggal" => $row["tanggal"],
            "pesanan" => []
        ];
    }

    if ($row["nama_menu"] !== null) {

        $data[$id]["pesanan"][] = [
            "nama" => $row["nama_menu"],
            "harga" => (int)$row["harga"],
            "jumlah" => (int)$row["jumlah"],
            "subtotal" => (int)$row["subtotal"]
        ];
    }
}

echo json_encode(array_values($data));

?>