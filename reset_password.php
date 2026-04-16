<?php

declare(strict_types=1);

$token = isset($_GET['token']) ? trim((string) $_GET['token']) : '';
$err = isset($_GET['err']) ? (string) $_GET['err'] : '';
$validToken = $token !== '' && preg_match('/^[a-f0-9]{64}$/i', $token);
$safeErr = htmlspecialchars($err, ENT_QUOTES, 'UTF-8');
$safeToken = htmlspecialchars($token, ENT_QUOTES, 'UTF-8');

?>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Set new password — Bell Ringing</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css" rel="stylesheet">
    <style>
        body {
            min-height: 100vh;
            margin: 0;
            background: rgba(33, 37, 41, 0.14);
            font-family: Arial, Helvetica, sans-serif;
        }

        .dialog-shell {
            min-height: 100vh;
            display: flex;
            align-items: center;
            justify-content: center;
            padding: 24px 12px;
        }

        .dialog-card {
            width: 100%;
            max-width: 520px;
            border: 1px solid #cfd4da;
            border-radius: 10px;
            background: #fff;
            box-shadow: 0 18px 45px rgba(0, 0, 0, 0.18);
            overflow: hidden;
        }

        .dialog-titlebar {
            display: flex;
            align-items: center;
            gap: 12px;
            padding: 14px 18px;
            background: #f3f4f6;
            border-bottom: 1px solid #d8dde3;
        }

        .dialog-titlebar img {
            max-height: 40px;
            width: auto;
        }

        .dialog-titlebar h1 {
            margin: 0;
            font-size: 1.05rem;
            color: #495057;
        }

        .dialog-body {
            padding: 22px 22px 18px;
        }

        .pwd-input-wrap {
            position: relative;
            width: 100%;
        }

        .pwd-input-wrap .form-control {
            padding-right: 2.5rem;
        }

        .pwd-input-wrap .pwd-toggle-inside {
            position: absolute;
            right: 5px;
            top: 50%;
            transform: translateY(-50%);
            width: 2.25rem;
            height: 1.85rem;
            border: none;
            background: transparent;
            color: #6c757d;
            display: flex;
            align-items: center;
            justify-content: center;
            border-radius: 0.25rem;
            z-index: 5;
            padding: 0;
        }

        .pwd-input-wrap .pwd-toggle-inside:hover,
        .pwd-input-wrap .pwd-toggle-inside:focus-visible {
            color: #212529;
            background: rgba(0, 0, 0, 0.06);
            outline: none;
        }

        .pwd-input-wrap .pwd-toggle-inside i {
            font-size: 1.1rem;
            pointer-events: none;
        }
    </style>
</head>

<body>
    <div class="dialog-shell">
        <div class="dialog-card">
            <div class="dialog-titlebar">
                <img src="mhk_std_logo_transparent 640.png" alt="" />
                <h1>Bell Ringing Password Reset</h1>
            </div>
            <div class="dialog-body">
                <h2 class="h5 card-title mb-3">Set a new password</h2>
                        <?php if ($err !== '') { ?>
                            <div class="alert alert-danger"><?php echo $safeErr; ?></div>
                        <?php } ?>
                        <?php if ($validToken) { ?>
                            <form method="post" action="password_reset_complete.php" id="resetForm">
                                <input type="hidden" name="token" value="<?php echo $safeToken; ?>">
                                <div class="mb-3">
                                    <label for="pwd" class="form-label">New password</label>
                                    <div class="pwd-input-wrap">
                                        <input type="password" name="pwd" id="pwd" class="form-control" required minlength="8" maxlength="128" autocomplete="new-password">
                                        <button type="button" class="pwd-toggle-inside" id="t1" title="Show password" aria-label="Show password"><i class="bi bi-eye"></i></button>
                                    </div>
                                    <div class="form-text">At least 8 characters.</div>
                                </div>
                                <div class="mb-3">
                                    <label for="pwd2" class="form-label">Confirm password</label>
                                    <div class="pwd-input-wrap">
                                        <input type="password" name="pwd2" id="pwd2" class="form-control" required minlength="8" maxlength="128" autocomplete="new-password">
                                        <button type="button" class="pwd-toggle-inside" id="t2" title="Show password" aria-label="Show password"><i class="bi bi-eye"></i></button>
                                    </div>
                                </div>
                                <button type="submit" class="btn btn-primary">Save password</button>
                                <a href="index.html" class="btn btn-link">Cancel</a>
                            </form>
                        <?php } else { ?>
                            <p class="text-muted mb-3">This page is opened from the link in your password reset email. If the link expired, request a new one from the Bell Ringing page using <strong>Forgot Password</strong>.</p>
                            <a href="index.html" class="btn btn-primary">Back to Bell Ringing</a>
                        <?php } ?>
            </div>
        </div>
    </div>
    <script>
        function wireToggle(btnId, inputId) {
            const btn = document.getElementById(btnId);
            const input = document.getElementById(inputId);
            if (!btn || !input) return;
            btn.addEventListener('click', () => {
                const icon = btn.querySelector('i');
                const show = input.type === 'password';
                input.type = show ? 'text' : 'password';
                if (icon) icon.className = show ? 'bi bi-eye-slash' : 'bi bi-eye';
                btn.setAttribute('title', show ? 'Hide password' : 'Show password');
                btn.setAttribute('aria-label', show ? 'Hide password' : 'Show password');
            });
        }
        wireToggle('t1', 'pwd');
        wireToggle('t2', 'pwd2');
        document.getElementById('resetForm')?.addEventListener('submit', (e) => {
            const a = document.getElementById('pwd').value;
            const b = document.getElementById('pwd2').value;
            if (a !== b) {
                e.preventDefault();
                alert('Passwords do not match.');
            }
        });
    </script>
</body>

</html>
