FROM ubuntu:20.04

# Make sure that we don’t get annoying prompts
ARG DEBIAN_FRONTEND=noninteractive

# Install our best friends; Apache, MySQL, and PHP. And also some other stuff
# that we may or may not need
RUN apt update \
    && \
    apt install -y \
    wordpress \
    php \
    libapache2-mod-php \
    mysql-server \
    php-mysql \
    php-mbstring \
    php-zip \
    php-gd \
    php-json \
    php-curl \
    phpmyadmin \
    htop \
    less \
    vim \
    sl \
    && \
    ln -s /usr/games/sl /usr/bin/sl

# Configure Apache so that it can serve WordPress and phpMyadmin
COPY wordpress.conf /etc/apache2/sites-available/wordpress.conf
COPY phpmyadmin.conf /etc/apache2/sites-available/phpmyadmin.conf

# Make sure that Apache will actually serve our applications
RUN a2ensite wordpress
RUN a2ensite phpmyadmin
RUN a2enmod rewrite

# Create database accounts
RUN service mysql start \
    && \
    mysql -e 'CREATE DATABASE wordpress;' \
    && \
    mysql -e "CREATE USER wordpress@localhost IDENTIFIED BY 'wordpress';" \
    && \
    mysql -e "GRANT ALL ON wordpress.* TO wordpress@localhost;" \
    && \
    mysql -e "CREATE USER phpmyadmin@localhost IDENTIFIED BY 'phpmyadmin';" \
    && \
    mysql -e "GRANT ALL ON *.* TO phpmyadmin@localhost;" \
    && \
    mysql -e "CREATE USER pma@localhost IDENTIFIED BY 'pmapass';" \
    && \
    mysql -e "GRANT ALL ON *.* TO pma@localhost;" \
    && \
    mysql -e 'FLUSH PRIVILEGES;'

# Configure applications with database credentials
COPY phpmyadmin-config.php /etc/phpmyadmin/config-db.php
COPY wordpress-config.php /etc/wordpress/config-localhost.php

# This doesn’t do much, but at least we’ve installed and configured something
RUN apt install -y ufw
RUN ufw allow 1:443/tcp

# Why would you want this? I don’t know, but let’s do it anyway
EXPOSE 1
EXPOSE 2
EXPOSE 3
EXPOSE 4
EXPOSE 5
EXPOSE 6
EXPOSE 7
EXPOSE 8
EXPOSE 9
EXPOSE 10
EXPOSE 11
EXPOSE 12
EXPOSE 13
EXPOSE 14
EXPOSE 15
EXPOSE 16
EXPOSE 17
EXPOSE 18
EXPOSE 19
EXPOSE 20
EXPOSE 21
EXPOSE 22
EXPOSE 23
EXPOSE 24
EXPOSE 25
EXPOSE 26
EXPOSE 27
EXPOSE 28
EXPOSE 29
EXPOSE 30
EXPOSE 31
EXPOSE 32
EXPOSE 33
EXPOSE 34
EXPOSE 35
EXPOSE 36
EXPOSE 37
EXPOSE 38
EXPOSE 39
EXPOSE 40
EXPOSE 41
EXPOSE 42
EXPOSE 43
EXPOSE 44
EXPOSE 45
EXPOSE 46
EXPOSE 47
EXPOSE 48
EXPOSE 49
EXPOSE 50
EXPOSE 51
EXPOSE 52
EXPOSE 53
EXPOSE 54
EXPOSE 55
EXPOSE 56
EXPOSE 57
EXPOSE 58
EXPOSE 59
EXPOSE 60
EXPOSE 61
EXPOSE 62
EXPOSE 63
EXPOSE 64
EXPOSE 65
EXPOSE 66
EXPOSE 67
EXPOSE 68
EXPOSE 69
EXPOSE 70
EXPOSE 71
EXPOSE 72
EXPOSE 73
EXPOSE 74
EXPOSE 75
EXPOSE 76
EXPOSE 77
EXPOSE 78
EXPOSE 79
EXPOSE 80
EXPOSE 81
EXPOSE 82
EXPOSE 83
EXPOSE 84
EXPOSE 85
EXPOSE 86
EXPOSE 87
EXPOSE 88
EXPOSE 89
EXPOSE 90
EXPOSE 91
EXPOSE 92
EXPOSE 93
EXPOSE 94
EXPOSE 95
EXPOSE 96
EXPOSE 97
EXPOSE 98
EXPOSE 99
EXPOSE 100
EXPOSE 101
EXPOSE 102
EXPOSE 103
EXPOSE 104
EXPOSE 105
EXPOSE 106
EXPOSE 107
EXPOSE 108
EXPOSE 109
EXPOSE 110
EXPOSE 111
EXPOSE 112
EXPOSE 113
EXPOSE 114
EXPOSE 115
EXPOSE 116
EXPOSE 117
EXPOSE 118
EXPOSE 119
EXPOSE 120
EXPOSE 121
EXPOSE 122
EXPOSE 123
EXPOSE 124
EXPOSE 125
EXPOSE 126
EXPOSE 127
EXPOSE 128
EXPOSE 129
EXPOSE 130
EXPOSE 131
EXPOSE 132
EXPOSE 133
EXPOSE 134
EXPOSE 135
EXPOSE 136
EXPOSE 137
EXPOSE 138
EXPOSE 139
EXPOSE 140
EXPOSE 141
EXPOSE 142
EXPOSE 143
EXPOSE 144
EXPOSE 145
EXPOSE 146
EXPOSE 147
EXPOSE 148
EXPOSE 149
EXPOSE 150
EXPOSE 151
EXPOSE 152
EXPOSE 153
EXPOSE 154
EXPOSE 155
EXPOSE 156
EXPOSE 157
EXPOSE 158
EXPOSE 159
EXPOSE 160
EXPOSE 161
EXPOSE 162
EXPOSE 163
EXPOSE 164
EXPOSE 165
EXPOSE 166
EXPOSE 167
EXPOSE 168
EXPOSE 169
EXPOSE 170
EXPOSE 171
EXPOSE 172
EXPOSE 173
EXPOSE 174
EXPOSE 175
EXPOSE 176
EXPOSE 177
EXPOSE 178
EXPOSE 179
EXPOSE 180
EXPOSE 181
EXPOSE 182
EXPOSE 183
EXPOSE 184
EXPOSE 185
EXPOSE 186
EXPOSE 187
EXPOSE 188
EXPOSE 189
EXPOSE 190
EXPOSE 191
EXPOSE 192
EXPOSE 193
EXPOSE 194
EXPOSE 195
EXPOSE 196
EXPOSE 197
EXPOSE 198
EXPOSE 199
EXPOSE 200
EXPOSE 201
EXPOSE 202
EXPOSE 203
EXPOSE 204
EXPOSE 205
EXPOSE 206
EXPOSE 207
EXPOSE 208
EXPOSE 209
EXPOSE 210
EXPOSE 211
EXPOSE 212
EXPOSE 213
EXPOSE 214
EXPOSE 215
EXPOSE 216
EXPOSE 217
EXPOSE 218
EXPOSE 219
EXPOSE 220
EXPOSE 221
EXPOSE 222
EXPOSE 223
EXPOSE 224
EXPOSE 225
EXPOSE 226
EXPOSE 227
EXPOSE 228
EXPOSE 229
EXPOSE 230
EXPOSE 231
EXPOSE 232
EXPOSE 233
EXPOSE 234
EXPOSE 235
EXPOSE 236
EXPOSE 237
EXPOSE 238
EXPOSE 239
EXPOSE 240
EXPOSE 241
EXPOSE 242
EXPOSE 243
EXPOSE 244
EXPOSE 245
EXPOSE 246
EXPOSE 247
EXPOSE 248
EXPOSE 249
EXPOSE 250
EXPOSE 251
EXPOSE 252
EXPOSE 253
EXPOSE 254
EXPOSE 255
EXPOSE 256
EXPOSE 257
EXPOSE 258
EXPOSE 259
EXPOSE 260
EXPOSE 261
EXPOSE 262
EXPOSE 263
EXPOSE 264
EXPOSE 265
EXPOSE 266
EXPOSE 267
EXPOSE 268
EXPOSE 269
EXPOSE 270
EXPOSE 271
EXPOSE 272
EXPOSE 273
EXPOSE 274
EXPOSE 275
EXPOSE 276
EXPOSE 277
EXPOSE 278
EXPOSE 279
EXPOSE 280
EXPOSE 281
EXPOSE 282
EXPOSE 283
EXPOSE 284
EXPOSE 285
EXPOSE 286
EXPOSE 287
EXPOSE 288
EXPOSE 289
EXPOSE 290
EXPOSE 291
EXPOSE 292
EXPOSE 293
EXPOSE 294
EXPOSE 295
EXPOSE 296
EXPOSE 297
EXPOSE 298
EXPOSE 299
EXPOSE 300
EXPOSE 301
EXPOSE 302
EXPOSE 303
EXPOSE 304
EXPOSE 305
EXPOSE 306
EXPOSE 307
EXPOSE 308
EXPOSE 309
EXPOSE 310
EXPOSE 311
EXPOSE 312
EXPOSE 313
EXPOSE 314
EXPOSE 315
EXPOSE 316
EXPOSE 317
EXPOSE 318
EXPOSE 319
EXPOSE 320
EXPOSE 321
EXPOSE 322
EXPOSE 323
EXPOSE 324
EXPOSE 325
EXPOSE 326
EXPOSE 327
EXPOSE 328
EXPOSE 329
EXPOSE 330
EXPOSE 331
EXPOSE 332
EXPOSE 333
EXPOSE 334
EXPOSE 335
EXPOSE 336
EXPOSE 337
EXPOSE 338
EXPOSE 339
EXPOSE 340
EXPOSE 341
EXPOSE 342
EXPOSE 343
EXPOSE 344
EXPOSE 345
EXPOSE 346
EXPOSE 347
EXPOSE 348
EXPOSE 349
EXPOSE 350
EXPOSE 351
EXPOSE 352
EXPOSE 353
EXPOSE 354
EXPOSE 355
EXPOSE 356
EXPOSE 357
EXPOSE 358
EXPOSE 359
EXPOSE 360
EXPOSE 361
EXPOSE 362
EXPOSE 363
EXPOSE 364
EXPOSE 365
EXPOSE 366
EXPOSE 367
EXPOSE 368
EXPOSE 369
EXPOSE 370
EXPOSE 371
EXPOSE 372
EXPOSE 373
EXPOSE 374
EXPOSE 375
EXPOSE 376
EXPOSE 377
EXPOSE 378
EXPOSE 379
EXPOSE 380
EXPOSE 381
EXPOSE 382
EXPOSE 383
EXPOSE 384
EXPOSE 385
EXPOSE 386
EXPOSE 387
EXPOSE 388
EXPOSE 389
EXPOSE 390
EXPOSE 391
EXPOSE 392
EXPOSE 393
EXPOSE 394
EXPOSE 395
EXPOSE 396
EXPOSE 397
EXPOSE 398
EXPOSE 399
EXPOSE 400
EXPOSE 401
EXPOSE 402
EXPOSE 403
EXPOSE 404
EXPOSE 405
EXPOSE 406
EXPOSE 407
EXPOSE 408
EXPOSE 409
EXPOSE 410
EXPOSE 411
EXPOSE 412
EXPOSE 413
EXPOSE 414
EXPOSE 415
EXPOSE 416
EXPOSE 417
EXPOSE 418
EXPOSE 419
EXPOSE 420
EXPOSE 421
EXPOSE 422
EXPOSE 423
EXPOSE 424
EXPOSE 425
EXPOSE 426
EXPOSE 427
EXPOSE 428
EXPOSE 429
EXPOSE 430
EXPOSE 431
EXPOSE 432
EXPOSE 433
EXPOSE 434
EXPOSE 435
EXPOSE 436
EXPOSE 437
EXPOSE 438
EXPOSE 439
EXPOSE 440
EXPOSE 441
EXPOSE 442
EXPOSE 443

CMD \
    service apache2 start \
    && \
    service mysql start \
    && \
    sleep infinity
