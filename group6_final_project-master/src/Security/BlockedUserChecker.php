<?php

namespace App\Security;

use App\Entity\User;
use Symfony\Component\Security\Core\Exception\CustomUserMessageAccountStatusException;
use Symfony\Component\Security\Core\User\UserCheckerInterface;
use Symfony\Component\Security\Core\User\UserInterface;

class BlockedUserChecker implements UserCheckerInterface
{
    /**
     * This method checks if the user is blocked before authentication.
     */
    public function checkPreAuth(UserInterface $user): void
    {
        if (!$user instanceof User) {
            return;
        }

        // Check if the user is blocked
        if ($user->isBlocked()) {
            // If the user is blocked, throw an exception to prevent login
            throw new CustomUserMessageAccountStatusException('Your account is blocked.');
        }
    }

    /**
     * This method can be used to check additional post-authentication status (if needed).
     */
    public function checkPostAuth(UserInterface $user): void
    {
        // Add post-authentication checks if needed
    }
}