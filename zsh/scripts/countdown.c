#include <stdio.h>
#include <stdlib.h>
#include <time.h>

#define GRADUATION 1494687600
#define DAY 86400
#define HOUR 3600
#define MINUTE 60

typedef enum {DAYS, HOURS, MINUTES, SECONDS} Scope;

void usage(void);
void count(time_t now, Scope scope);

void usage(void)
{
	printf("howlong [scope]\n");
	exit(1);
}

void count(time_t now, Scope scope)
{
	int wait;

	wait = GRADUATION - now;

	if (scope >= DAYS)
		printf("%d days", wait / DAY);
	if (scope >= HOURS)
		printf(", %d hours", (wait % DAY) / HOUR);
	if (scope >= MINUTES)
		printf(", %d minutes", (wait % HOUR) / MINUTE);
	if (scope == SECONDS)
		printf(", %d seconds", wait % MINUTE);
	printf("\n");

	exit(0);
}

int main(int argc, char **argv)
{
	time_t now, wait;

	if (argc > 2)
		usage();

	time(&now);

	if (argc == 2)
		switch(argv[1][0])
		{
			case 'd':
				count(now, DAYS);
				break;
			case 'h':
				count(now, HOURS);
				break;
			case 'm':
				count(now, MINUTES);
				break;
			case 's':
				count(now, SECONDS);
				break;
			default:
				usage();
		}

	wait = GRADUATION - now;

	/* automatic scope absent args */
	if (wait < DAY)
		count(now, MINUTES);
	else if (wait < 50 * DAY)
		count(now, HOURS);
	else
		count(now, DAYS);
}
