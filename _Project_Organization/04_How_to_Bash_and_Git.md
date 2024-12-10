# Project Manual: Bash and Git Workflow

This manual provides the essential **Bash commands** and **Git workflow** to ensure our team stays organized and on track for the **Meal Planner** project. Follow these instructions carefully to streamline collaboration and reduce errors.

---

## **1. Bash Commands**

### **1.1. Navigating the File System**

- **Check the current directory:**  
  ```bash
  pwd
  ```
- **List files and directories:**  
  ```bash
  ls
  ls -la   # Show hidden files and detailed info
  ```
- **Navigate between directories:**  
  ```bash
  cd folder_name   # Enter a folder
  cd ..            # Move up one level
  cd /path/to/directory  # Move to an absolute path
  ```
- **Create new files and directories:**  
  ```bash
  mkdir folder_name        # Create a folder
  touch file_name.extension  # Create an empty file
  ```
- **Copy or move files:**  
  ```bash
  cp source_file target_file  # Copy a file
  mv old_name new_name        # Rename or move a file
  ```
- **Remove files or directories:**  
  ```bash
  rm file_name             # Delete a file
  rm -r folder_name        # Delete a folder and its contents
  ```

---

### **1.2. Working with the Project**

- **Enter the project folder:**  
  ```bash
  cd /path/to/group6_final_project-master
  ```
- **Run the Symfony server:**  
  ```bash
  symfony serve
  ```
- **Install dependencies (once cloned):**  
  ```bash
  composer install
  npm install  # If applicable
  ```

---

## **2. Git Commands**

### **2.1. Git Basics**

1. **Check your current branch:**  
   ```bash
   git branch
   ```
   The active branch will be highlighted.

2. **Update your local repository:**  
   Always pull the latest changes before starting work.  
   ```bash
   git pull origin branch_name
   ```

3. **Stage changes for commit:**  
   ```bash
   git add file_name       # Add specific file
   git add .               # Add all changes
   ```

4. **Commit changes with a meaningful message:**  
   ```bash
   git commit -m "Your commit message"
   ```

5. **Push changes to the repository:**  
   ```bash
   git push origin branch_name
   ```

---

### **2.2. Branching Workflow**

1. **Create a new branch for your work:**  
   ```bash
   git checkout -b branch_name
   ```
   **Branch naming convention:**  
   ```
   feature/brief-description  # For new features
   bugfix/brief-description   # For fixing bugs
   ```
   Example: `feature/user-authentication`

2. **Switch to an existing branch:**  
   ```bash
   git checkout branch_name
   ```

3. **Merge changes into the main branch (Admin task):**  
   First, switch to the main branch:  
   ```bash
   git checkout main
   git merge branch_name
   ```

---

### **2.3. Resolving Merge Conflicts**

1. Pull the latest changes before merging:  
   ```bash
   git pull origin main
   ```

2. If a conflict occurs, open the file and manually resolve the conflict. Look for sections like this:  
   ```
   <<<<<<< HEAD
   Code from your branch
   =======
   Code from the other branch
   >>>>>>> main
   ```

3. After resolving, stage the file and continue:  
   ```bash
   git add conflicted_file
   git commit -m "Resolved merge conflict"
   ```

---

## **3. Project Workflow**

### **3.1. Cloning the Repository**

1. Clone the repository to your machine:  
   ```bash
   git clone <repository_url>
   ```
   Example:  
   ```bash
   git clone https://github.com/your-team/group6_final_project.git
   ```

2. Navigate into the project folder:  
   ```bash
   cd group6_final_project-master
   ```

3. Install dependencies:  
   ```bash
   composer install
   npm install  # If applicable
   ```

---

### **3.2. Daily Workflow**

1. **Start of the Day:**  
   - Pull the latest changes:  
     ```bash
     git pull origin main
     ```
   - Create a branch for your task:  
     ```bash
     git checkout -b feature/your-task
     ```

2. **While Working:**  
   - Stage and commit regularly:  
     ```bash
     git add .
     git commit -m "Describe your changes"
     ```

3. **End of the Day:**  
   - Push your branch to the remote repository:  
     ```bash
     git push origin feature/your-task
     ```

---

### **3.3. Testing & Reviewing**

1. Run Symfony’s built-in server to test locally:  
   ```bash
   symfony serve
   ```

2. Check logs for errors:  
   ```bash
   tail -f var/log/dev.log
   ```

3. Use GitHub Pull Requests for code reviews. Mention your reviewer in the PR description and include a summary of changes.

---

### **3.4. Finalizing Work**

1. Merge your branch into `main`:  
   - First, switch to `main`:  
     ```bash
     git checkout main
     ```
   - Pull the latest changes:  
     ```bash
     git pull origin main
     ```
   - Merge your branch:  
     ```bash
     git merge feature/your-task
     ```
   - Push the updated `main`:  
     ```bash
     git push origin main
     ```

---

## **4. Common Issues & Solutions**

1. **Forgot to pull before pushing:**  
   - Error:  
     ```text
     ! [rejected]        main -> main (fetch first)
     ```
   - Solution:  
     ```bash
     git pull origin main --rebase
     git push origin main
     ```

2. **Accidentally committed to the wrong branch:**  
   - Solution:  
     ```bash
     git checkout correct-branch
     git cherry-pick <commit-hash>
     git push origin correct-branch
     ```

3. **Lost track of changes:**  
   - See what’s changed:  
     ```bash
     git status
     ```

   - View commit history:  
     ```bash
     git log --oneline
     ```

4. **Undo a commit:**  
   - Reset to the previous state (before pushing):  
     ```bash
     git reset HEAD~1
     ```

---

## **5. Folder Structure Insights**

- **_Project_Organization:** All team coordination documents.
- **frontend:** Front-end related assets (HTML, CSS, JS).  
- **group6_final_project-master:** Main project with Symfony backend, Twig templates, and all logic.

---

## **Conclusion**

By following this workflow and using these commands, our team will stay organized, minimize conflicts, and ensure smooth collaboration throughout the project. Remember: Communicate frequently, commit often, and review changes carefully!
