# DEBUGGING.md

## Welcome to Debugging 101: The Art of Fighting Bugs

**Congratulations!** If you’re reading this, it means something broke (again). Fear not, for this guide will arm you with the tools, techniques, and sanity-preserving tips needed to hunt down and squash bugs in our Meal Planner project.

---

## **1. First Things First: Don’t Panic**

- Step away from the keyboard. Take a deep breath. Say, "It's probably just a missing semicolon."
- Remember: **Every bug is just an undocumented feature waiting to be fixed.**

---

## **2. General Debugging Checklist**

When something isn’t working, try the following:

1. **Check the Symfony Logs:**  
   Run the following to see what Symfony thinks is wrong:  
   ```bash
   tail -f var/log/dev.log
   ```
   If the error message makes you want to cry, congratulations—you’re debugging Symfony like a pro.

2. **Clear the Cache:**  
   Symfony loves its cache like we love pizza. Sometimes it just needs a refresh:  
   ```bash
   php bin/console cache:clear
   ```
   If this fixes the issue, promise yourself you’ll never forget this step again (you will).

3. **Check Your .env File:**  
   Environment variables gone rogue can wreak havoc. Ensure your database credentials, mailer settings, and secret keys are correct.  

4. **Restart the Symfony Server:**  
   The classic IT fix works here too:  
   ```bash
   symfony server:stop
   symfony server:start
   ```

---

## **3. Front-End Debugging**

### **CSS and JavaScript Issues**

- **Turn on the Inspector (F12):**  
  Use the browser dev tools to check for:
  - Missing assets
  - JavaScript errors in the console
  - Broken styles or misaligned elements

- **Force a Hard Refresh:**  
  Sometimes the browser stubbornly clings to an old version of your CSS or JS:  
  - **Windows:** `Ctrl + Shift + R`  
  - **Mac:** `Cmd + Shift + R`

- **Check the Network Tab:**  
  If your API calls are failing, check the network tab for:
  - **404s:** You forgot to add a route.  
  - **500s:** The back-end is throwing a tantrum. (See section 4 for handling this.)

---

## **4. Back-End Debugging**

### **Common Issues**

1. **"Why is my database empty?"**  
   - Run your migrations:  
     ```bash
     php bin/console doctrine:migrations:migrate
     ```
   - If your tables still look like the Sahara Desert, check `group6_meal_planner_project.sql` and ensure the schema matches.

2. **"My forms are breaking!"**  
   - Check your form types in `src/Form/`. Are all fields properly configured?  
   - Validate with Symfony’s built-in form debugger:  
     ```php
     dump($form->getErrors(true, false));
     ```

3. **"The page keeps redirecting!"**  
   - Check your security.yaml. Infinite loops often mean your roles or paths are misconfigured.  
   - Add a `dump($this->getUser())` in the controller to ensure the user session works as expected.

---

## **5. Git Blunders (and Recoveries)**

### **Common Scenarios**

1. **"I accidentally pushed a bug to `main`!"**  
   - Undo the last commit:  
     ```bash
     git revert HEAD
     ```
   - Apologize profusely in the team chat. Offer cookies as penance.

2. **"Merge conflicts everywhere!"**  
   - Use `git status` to find conflicted files. Open them and look for these angry lines:  
     ```
     <<<<<<< HEAD
     Code from your branch
     =======
     Code from main
     >>>>>>> main
     ```
   - Manually fix them, then:  
     ```bash
     git add resolved_file
     git commit -m "Resolved merge conflict"
     ```

3. **"I committed something embarrassing (like `console.log('hello world')`)."**  
   - Amend the commit to save face:  
     ```bash
     git commit --amend
     git push --force
     ```

---

## **6. Common Errors and Their Likely Causes**

| **Error Message**                | **Translation**                                                                                                                                   |
|----------------------------------|---------------------------------------------------------------------------------------------------------------------------------------------------|
| `500 Internal Server Error`      | Something is broken, but Symfony refuses to tell you what. Check the logs.                                                                       |
| `404 Not Found`                  | You probably forgot to define a route in `routes.yaml` or your browser is on the wrong URL.                                                      |
| `An exception occurred in the driver` | Your database credentials in `.env` are wrong, or your database server is having a siesta.                                                     |
| `Access Denied`                  | Check user roles and permissions. Did you forget to assign `ROLE_ADMIN` or `ROLE_USER`?                                                          |
| `No route found for "GET /whatever"` | You either misspelled the URL or didn’t define it properly in your controller.                                                                   |
| `Class App\Entity\Thing does not exist` | You forgot to generate or update your entities. Run: `php bin/console make:entity`.                                                           |
| `SQLSTATE[HY000]: General error` | Symfony and your database are not seeing eye-to-eye. Check your migration or query logic.                                                        |

---

## **7. When All Else Fails**

- **Google it.** Seriously, someone else has definitely had the same issue.
- **Rubber Duck Debugging:** Explain your problem to a teammate or even a rubber duck. The act of explaining often reveals the solution.
- **Ask for Help:**  
   Drop a message in the team chat with:
   - The exact error message
   - What you’ve tried so far
   - What you had for lunch (optional)

---

## **8. Debugging Tools**

### **Symfony Profiler**
- Access it by appending `_profiler` to your app URL:  
  `http://localhost:8000/_profiler`
- The profiler shows:
  - Request/response details
  - Database queries
  - Logs and error messages

### **Browser DevTools**
- Open with `F12` or `Cmd + Opt + I`.
- Key tabs:  
  - **Elements:** Check DOM and CSS.
  - **Console:** See JavaScript errors.
  - **Network:** Monitor API requests.

### **CLI Debugging**
- Dump and die (classic):  
  ```php
  dd($variable);
  ```
- Step-by-step debug:  
  ```bash
  symfony server:debug
  ```

---

## **9. Words of Wisdom**

- "Bugs are just opportunities in disguise."  
- "If debugging is the process of removing errors, programming must be the process of putting them in."  
- "Don’t code angry."

Good luck, and happy debugging!
