static const char *colorname[NUMCOLS] = {
	"#2b303b",     /* after initialization */
	"#65737e",   /* during input */
	"#bf616a",   /* wrong password */
};

/* treat a cleared input like a wrong password */
static const int failonclear = 1;
