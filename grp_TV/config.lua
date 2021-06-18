Config = {}

Config['URL'] = 'https://www.youtube.com/embed/%s?autoplay=1&controls=1&disablekb=1&fs=0&rel=0&showinfo=0&iv_load_policy=3&start=%s'
--Config['URL'] = 'https://www.youtube.com/watch?v=%s&t=%s' -- use this if you want to be able to play copyrighted stuff. please note that ads will pop up every now and again, and full screen doesn't work
Config['API'] = {
    ['URL'] = 'https://www.googleapis.com/youtube/v3/videos?id=%s&part=contentDetails&key=%s',
    ['Key'] = 'AIzaSyBKu5SyxnwXGbnpQquMcKTQ8mTxohRutlc'
}
Config['DurationCheck'] = false -- this will automatically delete the browser (good for ram i guess?) once the video has finished (REQUIRES YOU TO ADD AN API KEY!!!!!)

Config['Objects'] = {
    {
        ['Object'] = 'prop_tv_flat_01',
        ['Scale'] = 0.05,
        ['Offset'] = vec3(-0.925, -0.055, 1.0),
        ['Distance'] = 7.5,
    },
    {
        ['Object'] = 'prop_tv_flat_michael',
        ['Scale'] = 0.035,
        ['Offset'] = vec3(-0.675, -0.055, 0.4),
        ['Distance'] = 7.5,
    },
    {
        ['Object'] = 'prop_trev_tv_01',
        ['Scale'] = 0.012,
        ['Offset'] = vec3(-0.225, -0.01, 0.26),
        ['Distance'] = 7.5,
    },
    {
        ['Object'] = 'prop_tv_flat_03b',
        ['Scale'] = 0.016,
        ['Offset'] = vec3(-0.3, -0.062, 0.18),
        ['Distance'] = 7.5,
    },
    {
        ['Object'] = 'prop_tv_flat_03',
        ['Scale'] = 0.016,
        ['Offset'] = vec3(-0.3, -0.01, 0.4),
        ['Distance'] = 7.5,
    },
    {
        ['Object'] = 'prop_tv_flat_02b',
        ['Scale'] = 0.026,
        ['Offset'] = vec3(-0.5, -0.012, 0.525),
        ['Distance'] = 7.5,
    },
    --hizlis tv
    {
        ['Object'] = 'ex_prop_ex_tv_flat_01',
        ['Scale'] = 0.055,
        ['Offset'] = vec3(-0.99, -0.112, 1.100),
        ['Distance'] = 7.5,
    },
    {
        ['Object'] = 'prop_tv_flat_02',
        ['Scale'] = 0.026,
        ['Offset'] = vec3(-0.5, -0.012, 0.525),
        ['Distance'] = 7.5,
    },
    {
        ['Object'] = 'prop_tv_flat_02',
        ['Scale'] = 0.026,
        ['Offset'] = vec3(-0.5, -0.012, 0.525),
        ['Distance'] = 7.5,
    },
}

Strings = {
    ['VideoHelp'] = 'Schreib ~b~/tv ~y~youtube id~s~ um ein Video abzuspielen.\nBeispiel: ~b~/tv ~y~0LjeMhXKTuA~s~',
    ['VolumeHelp'] = 'Schreib ~b~/lautst ~y~(0-10)~s~ um die Lautstärke zu ändern.\nBeispiel: ~b~/lautst ~y~5~s~\n\nSchreib ~b~/tv ~y~youtube id~s~ um das Video zu ändern.\nExample: ~b~/tv ~y~0LjeMhXKTuA~s~\n\nSchreib ~b~/tvaus~s~ um das Video zu beenden\n\n~INPUT_CONTEXT~ um das Video mit allen Spielern zu Syncronisieren.',
}