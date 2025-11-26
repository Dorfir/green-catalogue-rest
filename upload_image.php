<?php
header('Access-Control-Allow-Origin: *');
header('Access-Control-Allow-Headers: Content-Type, X-Requested-With');
header('Access-Control-Allow-Methods: POST, GET, OPTIONS, DELETE, PUT');
header('Access-Control-Max-Age: 600');
header("Content-Type:application/json");

    if ($_SERVER['REQUEST_METHOD'] === 'POST' && isset($_FILES['fichier_image'])) {
    $uploadDir = __DIR__ . '/uploads/';
    if (!is_dir($uploadDir)) {
        mkdir($uploadDir, 0777, true);
    }

    $fileTmpPath = $_FILES['fichier_image']['tmp_name'];
    $fileExt = pathinfo($_FILES['fichier_image']['name'], PATHINFO_EXTENSION);
    $uniqueName = uniqid('img_', true) . '.' . $fileExt;
    $destPath = $uploadDir . $uniqueName;

    // echo json_encode(['status' => 'success', 'message' => 'Fichier recu', 'uniqueName' => $uniqueName]);

    if (move_uploaded_file($fileTmpPath, $destPath)) {
        echo json_encode(['status' => 'success', 'filename' => $uniqueName]);
    } else {
        echo json_encode(['status' => 'error', 'message' => 'Failed to move uploaded file.']);
    }
    } else {
    echo json_encode(['status' => 'error', 'message' => 'No image uploaded.']);
    }
?>