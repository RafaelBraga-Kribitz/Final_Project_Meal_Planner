<?php

namespace App\Service;

use Symfony\Component\HttpFoundation\File\Exception\FileException;
use Symfony\Component\HttpFoundation\File\UploadedFile;
use Symfony\Component\String\Slugger\SluggerInterface;

class UserFileUploader
{
    public function __construct(
        private string $targetDirectory, // target directory for users' pictures
        private SluggerInterface $slugger,
    ) {
    }

    public function upload(UploadedFile $file): string
    {
        // Get the original filename, sanitize it, and generate a new filename with a unique id
        $originalFilename = pathinfo($file->getClientOriginalName(), PATHINFO_FILENAME);
        $safeFilename = $this->slugger->slug($originalFilename);
        $fileName = $safeFilename.'-'.uniqid().'.'.$file->guessExtension();

        try {
            // Move the file to the target directory (users' pictures folder)
            $file->move($this->getTargetDirectory(), $fileName);
            return $fileName;
        } catch (FileException $e) {
            // Handle any file upload exception
            return "error.jpg";
        }
    }

    public function getTargetDirectory(): string
    {
        return $this->targetDirectory;
    }
}