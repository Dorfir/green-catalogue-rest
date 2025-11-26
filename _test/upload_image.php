<?php
if ($_SERVER['REQUEST_METHOD'] === 'POST' && isset($_FILES['image'])) {
    $uploadDir = __DIR__ . '/uploads/';
    if (!is_dir($uploadDir)) {
        mkdir($uploadDir, 0777, true);
    }

    $fileTmpPath = $_FILES['image']['tmp_name'];
    $fileExt = pathinfo($_FILES['image']['name'], PATHINFO_EXTENSION);
    $uniqueName = uniqid('img_', true) . '.' . $fileExt;
    $destPath = $uploadDir . $uniqueName;

    if (move_uploaded_file($fileTmpPath, $destPath)) {
        echo json_encode(['status' => 'success', 'filename' => $uniqueName]);
    } else {
        echo json_encode(['status' => 'error', 'message' => 'Failed to move uploaded file.']);
    }
} else {
    echo json_encode(['status' => 'error', 'message' => 'No image uploaded.']);
}
?>