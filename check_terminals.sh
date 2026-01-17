#!/bin/bash
# Скрипт для проверки наличия установленных терминалов

echo "Проверка наличия поддерживаемых терминалов..."

TERMINALS=("foot" "alacritty" "kitty" "wezterm" "xterm" "urxvt" "gnome-terminal" "konsole" "xfce4-terminal" "terminator")

FOUND_TERMINALS=()
for terminal in "${TERMINALS[@]}"; do
    if command -v "$terminal" &> /dev/null; then
        FOUND_TERMINALS+=("$terminal")
    fi
done

if [ ${#FOUND_TERMINALS[@]} -eq 0 ]; then
    echo "⚠️  ВНИМАНИЕ: Ни один из поддерживаемых терминалов не найден в системе!"
    echo "Для корректной работы функции спавна терминалов рекомендуется установить хотя бы один:"
    echo "sudo pacman -S foot alacritty kitty xterm rxvt-unicode gnome-terminal"
    echo ""
else
    echo "✓ Найдены следующие терминалы: ${FOUND_TERMINALS[*]}"
    echo ""
fi

echo "Проверка завершена."